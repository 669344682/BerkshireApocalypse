blur = {blurStrength = 7}
local screensource = dxCreateScreenSource(x,y);
blur.shader = dxCreateShader("Files/Shader/Blur.fx");

function blur.render()
	if(blur.shader)then
		dxUpdateScreenSource(screensource);
		dxSetShaderValue(blur.shader,"ScreenSource",screensource);
		dxSetShaderValue(blur.shader,"BlurStrength",blur.blurStrength);
		dxSetShaderValue(blur.shader,"UVSize",x,y);
		dxDrawImage(0,0,x,y,blur.shader);
	end
end