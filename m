Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF162B4B50
	for <lists.iommu@lfdr.de>; Mon, 16 Nov 2020 17:36:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 272F220014;
	Mon, 16 Nov 2020 16:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xs6HnvzIUIw0; Mon, 16 Nov 2020 16:36:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 484F22000E;
	Mon, 16 Nov 2020 16:36:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BF8CC07FF;
	Mon, 16 Nov 2020 16:36:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E823DC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 16:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF49F870A2
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 16:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FGyrc89Mb2v for <iommu@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:36:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5604E85926
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 16:36:11 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 597F420776;
 Mon, 16 Nov 2020 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605544571;
 bh=IZfzopMNCQqdPXHkBdcatEpepTwtxI9hKt+FYTBzPfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWZBHoLbnOugySLUX71V9yCMYR2+VX5+dZZ2abGfC5T+2DwqZtUuKPPRdk84pmekb
 fa2m7Zw3G/Eyqr5pBThUfdcOdZW1/o4+wHJnX5gWZVHO1G4H1aAKPBhNeMK2xh3yRY
 zwZXk3kf6Z0s61pqH8est37zsO4x3w+lOSPX7Ypw=
Date: Mon, 16 Nov 2020 16:36:03 +0000
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201116163603.GA30507@willie-the-truck>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <20201116155936.GE2224373@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116155936.GE2224373@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, iommu@lists.linux-foundation.org,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>, linux-gpio@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
 Kalle Valo <kvalo@codeaurora.org>, Todd Kjos <tkjos@google.com>
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

On Mon, Nov 16, 2020 at 04:59:36PM +0100, Thierry Reding wrote:
> On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index 7be48c1bec96d..6f431b73e617d 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -1280,6 +1280,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
> >  	{ .compatible = "qcom,scm" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
> >  
> >  static struct platform_driver qcom_scm_driver = {
> >  	.driver = {
> > @@ -1295,3 +1296,6 @@ static int __init qcom_scm_init(void)
> >  	return platform_driver_register(&qcom_scm_driver);
> >  }
> >  subsys_initcall(qcom_scm_init);
> > +
> > +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 04878caf6da49..c64d7a2b65134 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -248,6 +248,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >  	tristate "ARM Ltd. System MMU (SMMU) Support"
> >  	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > +	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >  	select IOMMU_API
> >  	select IOMMU_IO_PGTABLE_LPAE
> >  	select ARM_DMA_USE_IOMMU if ARM
> 
> This, in conjunction with deferred probe timeout, causes mayhem on
> Tegra186. The problem, as far as I can tell, is that there are various
> devices that are hooked up to the ARM SMMU, but if ARM SMMU ends up
> being built as a loadable module, then those devices will initialize
> without IOMMU support (because deferred probe will timeout before the
> ARM SMMU module can be loaded from the root filesystem).
> 
> Unfortunately, the ARM SMMU module will eventually end up being loaded
> once the root filesystem has been mounted (for example via SDHCI or
> Ethernet, both with using just plain, non-IOMMU-backed DMA API) and then
> initialize, configuring as "fault by default", which then results from a
> slew of SMMU faults from all the devices that have previously configured
> themselves without IOMMU support.

I wonder if fw_devlink=on would help here?

But either way, I'd be more inclined to revert this change if it's causing
problems for !QCOM devices.

Linus -- please can you drop this one (patch 3/3) for now, given that it's
causing problems?

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
