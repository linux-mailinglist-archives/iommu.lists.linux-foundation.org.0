Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88B51D74B
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 14:06:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3C761102;
	Fri,  6 May 2022 12:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2oRTJ-jgfZN; Fri,  6 May 2022 12:06:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EDC6610FD;
	Fri,  6 May 2022 12:06:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DD00C0081;
	Fri,  6 May 2022 12:06:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17683C002D
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 12:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0163D40904
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 12:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zyq4-oZzbF8 for <iommu@lists.linux-foundation.org>;
 Fri,  6 May 2022 12:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14DF7408CE
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 12:06:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC0D261F68;
 Fri,  6 May 2022 12:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4215CC385A8;
 Fri,  6 May 2022 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651838777;
 bh=J1BFnOrZCOSHrGx0h+sxgmQe0zh5fq+PoLA/EaqvKIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MBysmdTypb1LnzcGZ4cJXPF/zQ4aNjd8kO7ekgkF+E5LCDWrQDRbLjkjhZYHjI3VL
 Kgtq29zORPPwf/ZFbLnq5hw9X9eTFaDAYKao1/IhuBDlhfW6wLdzgKa1pj4YD7fWap
 nC9DqOef+XuGtLVm6rzS4Si2jwNSQiS6q3GM/vfP8vWQOWqty3wxo2Ayv13cKE/VoP
 MIQBhBSodm195bXu8Ha3DFijUYQdkXun6oSWnL10mHoGFqWZ53PqqtMQKMWPqAWLWq
 NfWNVktB2+7dNyeP3Ke1qQ1J381R4470NYJfxDsO9WiMnMtXW1CW+KpVD7mCVUof/i
 XQZRyUpDnuZCw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nmwis-009S7X-Oz; Fri, 06 May 2022 13:06:14 +0100
Date: Fri, 06 May 2022 13:06:14 +0100
Message-ID: <87pmkq7tmx.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,  Christoph Hellwig <hch@lst.de>
Subject: Re: fully convert arm to use dma-direct
In-Reply-To: <CACRpkdbdKBfmXGdyTm3T-MFAK30N-z4KH0k8eD8F7xaYUbDDhA@mail.gmail.com>
References: <20220421074204.1284072-1-hch@lst.de>
 <CACRpkdbdKBfmXGdyTm3T-MFAK30N-z4KH0k8eD8F7xaYUbDDhA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, hch@lst.de, linux@armlinux.org.uk,
 arnd@kernel.org, andre.przywara@arm.com, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu, laurentiu.tudor@nxp.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Andre Przywara <andre.przywara@arm.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Fri, 22 Apr 2022 22:17:20 +0100,
Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> On Thu, Apr 21, 2022 at 9:42 AM Christoph Hellwig <hch@lst.de> wrote:
> 
> > arm is the last platform not using the dma-direct code for directly
> > mapped DMA.  With the dmaboune removal from Arnd we can easily switch
> > arm to always use dma-direct now (it already does for LPAE configs
> > and nommu).  I'd love to merge this series through the dma-mapping tree
> > as it gives us the opportunity for additional core dma-mapping
> > improvements.
> (...)
> 
> >  b/arch/arm/mach-footbridge/Kconfig                   |    1
> >  b/arch/arm/mach-footbridge/common.c                  |   19
> >  b/arch/arm/mach-footbridge/include/mach/dma-direct.h |    8
> >  b/arch/arm/mach-footbridge/include/mach/memory.h     |    4
> 
> I think Marc Z has a Netwinder that he can test this on. Marc?
> I have one too, just not much in my office because of parental leave.

Finally found some time to hook the machine up and throw a new kernel
at it. Booted at its usual glacial speed, so FWIW:

Tested-by: Marc Zyngier <maz@kernel.org>

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
