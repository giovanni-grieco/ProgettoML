% Number of elements to keep
numElementsToKeep = 5000;

% Get the list of .mat files in the current directory
fileList = dir('*.mat');

for i = 1:length(fileList)
    % Load the .mat file
    data = load(fileList(i).name);
    
    % Assuming the variable in the .mat file is named 'matrix'
    % If the variable name is different, replace 'matrix' with the actual name
    variableNames = fieldnames(data);
    originalMatrix = data.(variableNames{1});
    
    % Check the size of the matrix
    if length(originalMatrix) >= numElementsToKeep
        % Trim the matrix
        trimmedMatrix = originalMatrix(1:numElementsToKeep);
        
        % Save the new matrix to a new .mat file
        [~, name, ~] = fileparts(fileList(i).name);
        newFileName = [name '_trimmed.mat'];
        save(newFileName, 'trimmedMatrix');
    else
        warning('File %s has less than %d elements. Skipping...', fileList(i).name, numElementsToKeep);
    end
end
