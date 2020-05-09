Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1A1CC1BE
	for <lists.iommu@lfdr.de>; Sat,  9 May 2020 15:21:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07DF386A40;
	Sat,  9 May 2020 13:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwdKU6wuCG7n; Sat,  9 May 2020 13:21:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E8AA86A3D;
	Sat,  9 May 2020 13:21:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7596BC07FF;
	Sat,  9 May 2020 13:21:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45738C07FF
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 34180886AB
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsqzaQG7V5sz for <iommu@lists.linux-foundation.org>;
 Sat,  9 May 2020 13:21:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4B681886E3
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:21:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z8so5164607wrw.3
 for <iommu@lists.linux-foundation.org>; Sat, 09 May 2020 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A6TtVR4HE6unY9v6nCG9GU0OO2uKkjUi5+GJSeht1Ng=;
 b=ruggBVJsEWvTdphLmqej/bZXdJgDfpZjVhXvl3qWfq85fSHiil8HO7jVDNm7nOLMO9
 EQiIRD06gSlwFsnnukEK/I8R5yv+5bzI/yyAqeX5he5GIuTbcKz+rvii6sL+8riHBtaG
 8CPrhPuWmZ3kBZzRoMJtuQg3VJekst2BRgcR/cB69Kw3JqvF35+rTyYabw1W9WM4szLW
 K7dh3NcpXEKQgEzvjJgqKHzKAALEE7JovkN0zOj5Mh+9hLacfq/WZb7flnh0+C69yzUA
 weQ0/mKCVzEtF7Hc0WUyL2LcnR/TGER8XEAUguoQ19+TkPgaLEQrmlOCWNiyMi2DUcVK
 LpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6TtVR4HE6unY9v6nCG9GU0OO2uKkjUi5+GJSeht1Ng=;
 b=hbs/kkJuL+IXh6w3VUUyTLllVgcVQSIYEZG3Ct5ITu34A6zo9h4SdgePPWfYboYeKE
 FzXyBHroxdhMKbqdR9t9uRhZS2Th3et29RuFhVOVgTHmhVXGxOuGuSoGIeNz/hTEDHiF
 /7cad5PILwtV0GliKL9K6yyXBGOJqYNwmlBMywIE3iGHmePu7FGIR2pgNbTtUYJBp12q
 p+2D+wGBD9/MO2ab1jGXJB3BI8Oy6McIoP1lzaQkzRVKZIFVmR2hTBGRDx10ZxUGvOnx
 g8HbshVXno4E9LCMjpEqNGalGPLeFtcCrPAZefAkV0PlCpm/2MWGiMfdZAvX7pUZbJ/J
 +pFA==
X-Gm-Message-State: AGi0Pub9FU43Xzg5LW46tOnLBbnk7VaE3vyylrNnEkXsifaf8UqiNfCy
 9jVeBnilb3pWY8b/I1kNMq36I6In+ylCug==
X-Google-Smtp-Source: APiQypKwBnfH8JXEfGcRsGXGOXgWr5/woVC4Th/Pwv3GchrPzvPNHSUozdj3z3hAEoNItxBUWDeXjw==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr9110301wro.201.1589030482524; 
 Sat, 09 May 2020 06:21:22 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
 by smtp.googlemail.com with ESMTPSA id
 a187sm18029715wmh.40.2020.05.09.06.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 May 2020 06:21:22 -0700 (PDT)
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
To: Shawn Guo <shawn.guo@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20200509130825.28248-1-shawn.guo@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e8150781-6000-dedc-ca10-6cee232c4364@linaro.org>
Date: Sat, 9 May 2020 16:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509130825.28248-1-shawn.guo@linaro.org>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Shawn,

On 5/9/20 4:08 PM, Shawn Guo wrote:
> On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> will not be correctly reflected, causing the system to go into a bad
> state.  Add it as an optional clock, so that platforms that have this
> clock can pass it over DT.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 0e2a96467767..2f6c6da7d540 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -45,6 +45,7 @@ struct qcom_iommu_dev {
>  	struct device		*dev;
>  	struct clk		*iface_clk;
>  	struct clk		*bus_clk;
> +	struct clk		*tlb_clk;
>  	void __iomem		*local_base;
>  	u32			 sec_id;
>  	u8			 num_ctxs;
> @@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
>  		return ret;
>  	}
>  
> +	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
> +	if (ret) {
> +		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
> +		clk_disable_unprepare(qcom_iommu->bus_clk);
> +		clk_disable_unprepare(qcom_iommu->iface_clk);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
>  static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
>  {
> +	clk_disable_unprepare(qcom_iommu->tlb_clk);
>  	clk_disable_unprepare(qcom_iommu->bus_clk);
>  	clk_disable_unprepare(qcom_iommu->iface_clk);
>  }
> @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  		return PTR_ERR(qcom_iommu->bus_clk);
>  	}
>  
> +	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");

IMO, devm_clk_get_optional() would be better.

> +	if (IS_ERR(qcom_iommu->tlb_clk)) {
> +		dev_dbg(dev, "failed to get tlb clock\n");
> +		qcom_iommu->tlb_clk = NULL;
> +	}
> +
>  	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
>  				 &qcom_iommu->sec_id)) {
>  		dev_err(dev, "missing qcom,iommu-secure-id property\n");
> 

-- 
regards,
Stan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
