Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DF50C38F92E
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 06:03:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F149583C3C;
	Tue, 25 May 2021 04:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s05NJApxRyeH; Tue, 25 May 2021 04:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9B883C34;
	Tue, 25 May 2021 04:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1ABEC0024;
	Tue, 25 May 2021 04:03:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C253FC0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 04:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B2C40167
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 04:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvGn2CsqxS9I for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 04:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5A8140104
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 04:03:25 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t24so13569340oiw.3
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 21:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6tmkFwE9gEojemy41RKVeGqItGxaoarfu1zkeWiXbe4=;
 b=hf0kiOizuF9L+wlT35AN8K5vbzNTM0goou8lM4qeIntSrU77A/Ea8njGkzZIlhDOWD
 JUhK6rDcHXUyVeurIBsKcMsVwoHmCBRGWnRDLqB7tPMaDEf6caRX/Rnmjb+elcQiqZX9
 w9SvrroR00FtL2rgqcACAZbj8XxvLUO7K9xtZvKMc/ceJFLJb0+7H6Xami1qx5huAmzp
 6LjkYCl1Ruj9IBHmYl0N63J1JQ2KxjLewROEOUwDehf15OTob/+u1FHb3+ySeIxbLag9
 kWcdT5pfvtjQRmP+ue2wLNPoEdX2hKCCyVhm1SyVfeagU/slCOUyiLybB7M2D9fTz8cW
 piiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6tmkFwE9gEojemy41RKVeGqItGxaoarfu1zkeWiXbe4=;
 b=paF1xHp6bTSI3JrRt91nhFpnbVHXvnZT+ywdnyheQsx1qpZQEU26OzWRUp2ns2BBrZ
 957RROUhPiY7wF3pQxX+OWmZyDKwLzNwySns7xQXsBRJ1o+/nDcGhGFr6qLKWG7AJTMA
 5WuNFlmrtNjNl3rhuycRcCJ8IyPLJmc5mfWOj95p5HTtJrrEUWZH7h8qM6cYEW0tr58c
 egE8TZYZspvC+9L1nPlsfnd6J7y8tPyBKNyVeb7TNph0LzNMQYPH5McAumve+wlmzvol
 1vGt/AcZUwNm6yngtUf1PHA6aOtKGSbRbxHy/5gUlCrBcV42AQ6uF27Z3BWHDZdvGj+K
 +fzg==
X-Gm-Message-State: AOAM531skmW+ebPH8shhv6nlVvtZfqFP3OoCurTPGJdZRj3+JNpaKMRK
 ymOhUMUxAWVxe+mPH11Eyfx/Wg==
X-Google-Smtp-Source: ABdhPJxPc5Dt8YG6neMXiB44kx2vOieWPtfSC1+ziJQvCr9LXCWJR5tIEr7OzJ1Mw6NeT8EhwXgVag==
X-Received: by 2002:aca:d596:: with SMTP id m144mr1480959oig.172.1621915404846; 
 Mon, 24 May 2021 21:03:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k21sm3454117otr.3.2021.05.24.21.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 21:03:24 -0700 (PDT)
Date: Mon, 24 May 2021 23:03:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3 1/2] iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
Message-ID: <YKx3CiSYshq6BM1f@yoga>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <b1ab02b5bcb5e0aab71e2649468ce82bd6d5ca49.1618898456.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1ab02b5bcb5e0aab71e2649468ce82bd6d5ca49.1618898456.git.saiprakash.ranjan@codeaurora.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Tue 20 Apr 01:04 CDT 2021, Sai Prakash Ranjan wrote:

> Add compatible for SC7280 SMMU to use the Qualcomm Technologies, Inc.
> specific implementation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 98b3a1c2a181..bea3ee0dabc2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -166,6 +166,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
> +	{ .compatible = "qcom,sc7280-mdss" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },
> @@ -330,6 +331,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,msm8998-smmu-v2" },
>  	{ .compatible = "qcom,sc7180-smmu-500" },
> +	{ .compatible = "qcom,sc7280-smmu-500" },
>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>  	{ .compatible = "qcom,sdm845-smmu-500" },
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
