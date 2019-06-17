Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D3455487CD
	for <lists.iommu@lfdr.de>; Mon, 17 Jun 2019 17:48:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C8BCAD84;
	Mon, 17 Jun 2019 15:48:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08413C87
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 15:48:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9621C828
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 15:48:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p184so5902534pfp.7
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DjrSOfTvDLkGf6iVBEOXJC3VEAO5WnRtp67QcJ8Nncw=;
	b=jMR0NWkBB5rJ7tngeQ5upW/0VTi6DqFN1abkWnF7Xa1dbYwLNr7dzLjTQfC/leYfBQ
	zEdif1npDIyZd9T9GQm5MizGXdVFO2P5xnxD4/BaZkX7/9Iutd3bFrjgPe9fBAk24JxP
	QUtGtkt3uBWDMfjXokSEIO61vwxM5SdF3sX7vxL5QtKyqhddT+7n93khhKzaEfwoViEn
	cZXQzi/D9jNTphtuHf+ra5LPcZfqGBrTLOEa3HBSoXAfdk899KmJTTeCAxU5cdjqNqZb
	6AGvg6/9FALBIZy34vBdUkE20rhLR4L8sLdVQddtp+lEB6nTDK3lYBsRYaW8Myny1HtL
	Tz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DjrSOfTvDLkGf6iVBEOXJC3VEAO5WnRtp67QcJ8Nncw=;
	b=QFGnrq9QxfMs9eLziqN2EWIRpZVETKfC/7u2fBmXu8Pne6OKfuWYr998syxH6raz2+
	dMxrviP0ext2BQRuy5VEwMMiTfQgORXreZQZIjNfn5uwKMidNvhyr7XN8UPDG4RuU+1i
	QjikdJnT3J1YJ/Too8gbOosZurotQuq+/2YMjufuaoWZFVVEhm0CVHb0zV2hsCmCay27
	Ma7ULJcMX2fldBVZR1HB2uILvLsOvEMYaMG5z4xXU24f5PvNpmW9I2szhET+H3QIIwu3
	UimGvnXckUabHKTw2DD8x4aneOsIruxZfSgXUCL2Y2N3700WVXuFpu1mZ3zy3d/Jh3Cu
	87xw==
X-Gm-Message-State: APjAAAVn/iLCD6NzwFxhdlHqxwS7lNY5OJrlTPlGlmNy+CBxDF4LJ82E
	/50j6iXLM2b/0lOCH+3A9PZ4Kw==
X-Google-Smtp-Source: APXvYqwskv991mM7mCyvgK6hOG+rzwh1Zp3Tf/txWE+/te2Gh3S7So3gTqhDDcsp0QZ4hgMhliXUnA==
X-Received: by 2002:a17:90a:f498:: with SMTP id
	bx24mr27315789pjb.91.1560786511899; 
	Mon, 17 Jun 2019 08:48:31 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
	[104.188.17.28]) by smtp.gmail.com with ESMTPSA id
	v5sm13376988pfm.22.2019.06.17.08.48.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 08:48:31 -0700 (PDT)
Date: Mon, 17 Jun 2019 08:49:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8998: Add ANOC1 SMMU node
Message-ID: <20190617154921.GF31088@tuxbook-pro>
References: <edade219-aa77-e7f0-af68-1c192632b2ca@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edade219-aa77-e7f0-af68-1c192632b2ca@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Evan Green <evgreen@chromium.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Manu Gautam <mgautam@codeaurora.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>
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

On Mon 01 Apr 08:40 PDT 2019, Marc Gonzalez wrote:

> The MSM8998 ANOC1(*) SMMU services BLSP2, PCIe, UFS, and USB.
> (*) Aggregate Network-on-Chip #1
> 
> Based on the following DTS downstream:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm-arm-smmu-8998.dtsi?h=LE.UM.1.3.r3.25#n18
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Patch 1 applied

Thanks,
Bjorn

> ---
> Changes from v1:
> 	Split off from "PCIe and AR8151 on APQ8098/MSM8998" series
> 	Change compatible string to use qcom,msm8998-smmu-v2
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index ef71e8f1d102..f807ea3e2c6e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -606,6 +606,21 @@
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> +		anoc1_smmu: arm,smmu@1680000 {
> +			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> +			reg = <0x01680000 0x10000>;
> +			#iommu-cells = <1>;
> +
> +			#global-interrupts = <0>;
> +			interrupts =
> +				<GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		tcsr_mutex_regs: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0x1f40000 0x20000>;
> -- 
> 2.17.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
