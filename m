Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 953182125F8
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 16:18:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31EC98A276;
	Thu,  2 Jul 2020 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaqAaDcmPhoA; Thu,  2 Jul 2020 14:18:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4A728A189;
	Thu,  2 Jul 2020 14:18:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4BCEC0733;
	Thu,  2 Jul 2020 14:18:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30D6BC0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 14:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1573626BD5
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 14:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPCqzV+b8Z0W for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A05724981
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 14:18:31 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E49A20772;
 Thu,  2 Jul 2020 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593699511;
 bh=OUQQW1JU24wJrZp3dLNN4aZNP+OkKamWFoOkvma1MWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AybHI1SNLDlZLjJHhnUxl1vNrkcBryZEHUtTXKlejzlQSYoGW1ipuNN987H7J4DY3
 X27y+baEEdaxlSIiZwvoLfoxIquGj2HAFLURbjU84wkSlY024jbgft/RsH+6u99FCs
 R9ApqJA5yvh7QYn+K7yymrEJe25TxhG7yBX2Cy4w=
Date: Thu, 2 Jul 2020 15:18:25 +0100
From: Will Deacon <will@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20200702141825.GA16941@willie-the-truck>
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625001039.56174-6-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>
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

On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index b510f67dfa49..714893535dd2 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
>  config ARM_SMMU
>  	tristate "ARM Ltd. System MMU (SMMU) Support"
>  	depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> +	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU if ARM

This looks like a giant hack. Is there another way to handle this?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
