vector=[422, 421, 417, 418, 412, 414, 416, 414, 417, 417, 417, 423, 424, 419, 423, 425, 426, 424, 422, 422, 424, 423, 420, 416, 417, 415, 413, 415, 417, 414, 416, 424, 430, 426, 425, 434, 435, 432, 432, 432, 432, 431, 432, 428, 426, 427, 425, 421, 419, 418, 411, 415, 415, 412, 416, 418, 421, 424, 424, 425, 432, 432, 429, 432, 433, 432, 433, 434, 431, 434, 433, 434, 436, 431, 429, 434, 436, 436, 438, 437, 436, 435, 439, 440, 434, 432, 433, 436, 432, 432, 432, 434, 434, 435, 438, 437, 434, 439, 440, 438, 443];

meanValue = mean(vector);
% Compute the absolute differences.  It will be a vector.
absoluteDeviation = abs(vector - meanValue);
% Compute the median of the absolute differences
mad = median(absoluteDeviation);
% Find outliers.  They're outliers if the absolute difference
% is more than some factor times the mad value.
sensitivityFactor = 1; % Whatever you want.
thresholdValue = sensitivityFactor * mad;
outlierIndexes = abs(absoluteDeviation) > thresholdValue;
% Extract outlier values:
outliers = vector(outlierIndexes);
% Extract non-outlier values:
nonOutliers = vector(~outlierIndexes);
plot(nonOutliers)
mean(nonOutliers)