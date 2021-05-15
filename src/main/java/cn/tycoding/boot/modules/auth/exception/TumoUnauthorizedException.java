package cn.tycoding.boot.modules.auth.exception;

import cn.tycoding.boot.common.core.api.HttpCode;
import cn.tycoding.boot.modules.auth.component.TumoOAuth2ExceptionSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 拒绝访问异常
 *
 * @author tycoding
 * @see org.springframework.security.oauth2.provider.error.DefaultWebResponseExceptionTranslator
 * @since 2020/10/16
 */
@JsonSerialize(using = TumoOAuth2ExceptionSerializer.class)
public class TumoUnauthorizedException extends TumoOAuth2Exception {

    public TumoUnauthorizedException(String msg, Throwable t) {
        super(msg);
    }

    @Override
    public String getOAuth2ErrorCode() {
        return HttpCode.AUTH_UN_AUTHORIZED.getMsg();
    }

    @Override
    public int getHttpErrorCode() {
        return HttpCode.AUTH_UN_AUTHORIZED.getCode();
    }
}
