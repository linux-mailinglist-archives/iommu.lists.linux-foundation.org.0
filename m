Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18D82795
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 00:26:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CC9B313C3;
	Mon,  5 Aug 2019 22:26:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8E8513BD
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 22:26:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 778735E4
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 22:26:31 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so34222678pgc.1
	for <iommu@lists.linux-foundation.org>;
	Mon, 05 Aug 2019 15:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Rg+oeCwUo/H+oN9H7Czh/5Y4i017SsaPztYn9tG5d2Y=;
	b=ADhAmScpEWlovyJVTyLKzuJz7F5Qrq+05RPL+6N4C4JRJ7fOnPN2zbO7DvvQffhW8t
	5qCOWU2XnFCFiC8n5RMcwqomSreqCMq1Gd2WwapvE6fGGByk3q1c/RjssbFirWe47w3t
	rcsghBXRcnVkLDfhKqTREFm1Xgn01kZZHslN8gOWp9twHwe8fk3fZUehesVIe2MWHtQs
	qi43lT+ENVcIfYraXarMf3sHx//4IEgUiEhzwUuK7wdnLbbCJJvoILbsRb2y4m+iFGTY
	Hx12ZTXyS/cOmpcxo1o/nZidvq+YrehQDR/opapH7e94CZ6hEodbKqes5cLvviEL1CNE
	LlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Rg+oeCwUo/H+oN9H7Czh/5Y4i017SsaPztYn9tG5d2Y=;
	b=khM3Wy0mzSZR8tu4vHcSW3Yvjnp7I+THJdlRVle6/SVD7joooO/JeV9R5lIes8gdVw
	4D/roHuHviagkDKgvCQsuxZZqUs5YKsGD/b2BbITTXAd2mKsWXlJshj1NG0BtSZ5NqLR
	7wPt/GTE4QgDkjZ+wzeqI5+Yzi1iLR+RhseDJnmbLSfsgYZnNUKXmj3/b3E8VNCXkcwS
	pOCTTLtStVKOkF7WMKLpxnSRIvzdKVBkWJo5LPbSm3wR2G78u+8YtJHalPJJi9ibvnJM
	yifaG7/IuyNFtvf2Qznc/R1iSc9ObciTzmWbgvGgshHsZL1Pvzdw+oAgLxpzwq0g6wBG
	uwrA==
X-Gm-Message-State: APjAAAVBitO///gviqlf2Y/3T5eHf7x5OpYXlfjzV6DdY8P9Qu5fmdpN
	uiKTuFw5QCAORCtx1rDwp3X7Hg==
X-Google-Smtp-Source: APXvYqzc51XuCht++M4ETl3qnE2tsM6OOV5lrOa8+FmdxOB6VKu1S1xAEQXEr6+Qn0fnjFDRK43mvA==
X-Received: by 2002:a65:65c5:: with SMTP id y5mr140011pgv.342.1565043990719;
	Mon, 05 Aug 2019 15:26:30 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
	[104.188.17.28]) by smtp.gmail.com with ESMTPSA id
	u6sm17486631pjx.23.2019.08.05.15.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Aug 2019 15:26:29 -0700 (PDT)
Date: Mon, 5 Aug 2019 15:26:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
	sequence handler on MTP
Message-ID: <20190805222627.GA2634@builder>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-5-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612071554.13573-5-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	will.deacon@arm.com, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, david.brown@linaro.org,
	iommu@lists.linux-foundation.org, agross@kernel.org, robin.murphy@arm.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:

> Indicate on MTP SDM845 that firmware implements handler to
> TLB invalidate erratum SCM call where SAFE sequence is toggled
> to achieve optimum performance on real-time clients, such as
> display and camera.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 78ec373a2b18..6a73d9744a71 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2368,6 +2368,7 @@
>  			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x80000>;
>  			#iommu-cells = <2>;
> +			qcom,smmu-500-fw-impl-safe-errata;

Looked back at this series and started to wonder if there there is a
case where this should not be set? I mean we're after all adding this to
the top 845 dtsi...

How about making it the default in the driver and opt out of the errata
once there is a need?

Regards,
Bjorn

>  			#global-interrupts = <1>;
>  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
