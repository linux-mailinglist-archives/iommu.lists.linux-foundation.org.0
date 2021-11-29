Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECA462188
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 21:06:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F4BB814AB;
	Mon, 29 Nov 2021 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21BRbAr2q94x; Mon, 29 Nov 2021 20:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A7CB48104F;
	Mon, 29 Nov 2021 20:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76AF0C0030;
	Mon, 29 Nov 2021 20:06:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E89AC000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 20:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23E9A8104F
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 20:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLb4DE5OVbK8 for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 20:06:47 +0000 (UTC)
X-Greylist: delayed 00:09:42 by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C8480EF8
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 20:06:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E52BB8159E;
 Mon, 29 Nov 2021 19:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29009C53FC7;
 Mon, 29 Nov 2021 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638215819;
 bh=DhEombK07QwNpXLoXCpOa6HpTzpV1NgajiSa+1qwN+k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G/KxpR0xy14HXlT475qhaNwJrIxGYP/VsTeY+NiH1U2p2H5PmALhUHuDP4hkjOS5h
 3lXp3PDufcrlUvBTVZO9d7j9TiJl8STfLCuiDcBUD6jBV4smCa81kBrpO1mnSocjVj
 3U24gDeDb89Eh7BebiuM27eb+200niBO8f6FyxLRunkHUAEZlsfdRqCc+vFlwQ2dmK
 f+jw49pRuDRaEzpLkQ4lkOdH6W9D/uKM0E46vuo4PqfGRCoGtbv/w39lmFHgbN6fG7
 J3gSGPvUHbqdR9AK5MlvAOb5Nd8471kkNOtChSeIIjWtYkYiqys+s9OLB/cRpTVjRx
 ICNuZdXwRdytw==
Message-ID: <ec986700-48b7-6b35-b404-efb578dccb3c@kernel.org>
Date: Mon, 29 Nov 2021 14:56:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [patch 37/37] dmaengine: qcom_hidma: Cleanup MSI handling
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20211126224100.303046749@linutronix.de>
 <20211126230526.111397616@linutronix.de>
From: Sinan Kaya <okaya@kernel.org>
In-Reply-To: <20211126230526.111397616@linutronix.de>
Cc: Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, x86@kernel.org,
 Ashok Raj <ashok.raj@intel.com>, Stuart Yoder <stuyoder@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zygnier <maz@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Tero Kristo <kristo@kernel.org>,
 Megha Dey <megha.dey@intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 11/26/2021 8:22 PM, Thomas Gleixner wrote:
> There is no reason to walk the MSI descriptors to retrieve the interrupt
> number for a device. Use msi_get_virq() instead.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> Cc: Sinan Kaya<okaya@kernel.org>
> Cc:dmaengine@vger.kernel.org

Acked-by: Sinan Kaya <okaya@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
