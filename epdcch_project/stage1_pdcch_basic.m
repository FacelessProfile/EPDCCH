% проверка тракта PDCCH без шума
% путь: DCI биты -> CCE -> сетка подкадра -> декодирование

clear; clc;


% CFG
enb.NDLRB        = 50;
enb.CyclicPrefix = 'Normal';
enb.CFI          = 2;          % Первые 2 символа подкадра отданы под PDCCH
enb.CellRefP     = 1;          % 1 tx ant
enb.NCellID      = 0;          % Номер соты
enb.NSubframe    = 0;


% DCI generation
ueRNTI = 100;
dciConfig.DCIFormat = 'Format1A';
[dciStruct, dciBits] = lteDCI(enb, dciConfig);
fprintf('Длина DCI: %d bit\n', length(dciBits));


% 1 CCE = 36 RE = 72 бита, при AL=4 нужно 4 * 72 = 288 бит
AL = 4;
codedBits = lteDCIEncode(enb, dciBits, ueRNTI, AL * 72);
fprintf('Закодировано для AL=%d: %d bit (было %d, стало %d)\n', ...
    AL, length(codedBits), length(dciBits), length(codedBits));


% места под PDCCH в субкадре
pdcchIndices = ltePDCCHIndices(enb);
totalCCE = floor(length(pdcchIndices) / 36);
fprintf('Всего CCE: %d шт.\n', totalCCE);


% сообщение кладется в первые 4 CCE
allPdcchBits = -1 * ones(length(pdcchIndices) * 2, 1); % -1 тут = пустое место
allPdcchBits(1:AL*72) = codedBits;


% QPSK modulation, grid drafting
subframeGrid = lteDLResourceGrid(enb);
subframeGrid(pdcchIndices) = ltePDCCH(enb, allPdcchBits);


% RX (пока без шума)
rxSymbols = subframeGrid(pdcchIndices);
rxLLR = ltePDCCHDecode(enb, rxSymbols);


% decoding
rxCandidateLLR = rxLLR(1:AL*72);
[rxDciBits, rxRNTI] = lteDCIDecode(enb, rxCandidateLLR, length(dciBits), 'Format1A');


fprintf('\n--- Итоги проверки ---\n');
fprintf('Переданный RNTI: %d | Принятый RNTI: %d\n', ueRNTI, rxRNTI);
fprintf('Ошибок в битах:  %d\n', sum(abs(rxDciBits-dciBits)));
if rxRNTI == ueRNTI && isequal(rxDciBits, dciBits)
    disp('Успех: DCI доставлен и декодирован без единой ошибки!');
else
    disp('Ошибка: данные искажены(((');
end
