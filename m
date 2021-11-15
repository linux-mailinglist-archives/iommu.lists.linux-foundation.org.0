Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8804B451753
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 23:17:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063666066E;
	Mon, 15 Nov 2021 22:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tm9063VRpvC4; Mon, 15 Nov 2021 22:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0FF016078A;
	Mon, 15 Nov 2021 22:17:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDEC5C0012;
	Mon, 15 Nov 2021 22:17:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF653C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 22:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD0804022E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 22:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yw2NpqTORb5 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 22:17:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B36D40225
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 22:17:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96FA561AD2;
 Mon, 15 Nov 2021 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637014668;
 bh=O3XWXpuP4JyzBpAnL/WOSpf8m8SFaojzS7K+2Ae5RZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=km/LghMuevoo8pewpHoaepFIkXTw+JY5kSemLdsSd/WNU9oyMsKve+s0YIjjAglss
 vlgxo1iJb2GAMkAHvbCJLidq1dpdAO+IxmV5v16pVbdM+athvPzsLQ+0/ReU28wnmO
 QOqbuQCv97q1aYNECVRhKlNgu5oiGDh2AqzF3ppuiBdttPDU1SUcYlUeWwWFmEMvig
 n1mVNEKc8pFKkj3BMEio9QX9SAhekriQvtPvR0cm0JIVyw3DITrSCi4e9WX0enpF2f
 V4MXczkaxJqtk7t5xtn1PSIGdiviCqz36wVPPktfv1ENLaelF7f3R3DS49EmeVlK4f
 XuO+mHaVSfJPw==
Date: Mon, 15 Nov 2021 16:17:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 03/11] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20211115221747.GA1587608@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-4-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
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

On Mon, Nov 15, 2021 at 10:05:44AM +0800, Lu Baolu wrote:
> pci_stub allows the admin to block driver binding on a device and make
> it permanently shared with userspace. Since pci_stub does not do DMA,
> it is safe. However the admin must understand that using pci_stub allows
> userspace to attack whatever device it was bound to.

This commit log doesn't say what the patch does.  I think it tells us
something about what pci-stub *already* does ("allows admin to block
driver binding") and something about why that is safe ("does not do
DMA").

But it doesn't say what this patch changes.  Based on the subject
line, I expected something like:

  As of ("<commit subject>"), <some function>() marks the iommu_group
  as containing only devices with kernel drivers that manage DMA.

  Avoid this default behavior for pci-stub because it does not program
  any DMA itself.  This allows <some desirable behavior>.

> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/pci/pci-stub.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pci-stub.c b/drivers/pci/pci-stub.c
> index e408099fea52..6324c68602b4 100644
> --- a/drivers/pci/pci-stub.c
> +++ b/drivers/pci/pci-stub.c
> @@ -36,6 +36,9 @@ static struct pci_driver stub_driver = {
>  	.name		= "pci-stub",
>  	.id_table	= NULL,	/* only dynamic id's */
>  	.probe		= pci_stub_probe,
> +	.driver		= {
> +		.suppress_auto_claim_dma_owner = true,
> +	},
>  };
>  
>  static int __init pci_stub_init(void)
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
