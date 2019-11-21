Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CA868105905
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 19:02:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8855A204FB;
	Thu, 21 Nov 2019 18:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsNHtlgqmQm4; Thu, 21 Nov 2019 18:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E861220479;
	Thu, 21 Nov 2019 18:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5F6BC18DA;
	Thu, 21 Nov 2019 18:02:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9FE2C18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 18:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D693920479
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 18:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5CZAYbZr+n8 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 18:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 9D31120242
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 18:02:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D95E68BFE; Thu, 21 Nov 2019 19:02:26 +0100 (CET)
Date: Thu, 21 Nov 2019 19:02:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI
 board installed, unless RAM size limited to 3500M
Message-ID: <20191121180226.GA3852@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
 mad skateman <madskateman@gmail.com>, "contact@a-eon.com" <contact@a-eon.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 nsaenzjulienne@suse.de
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

On Thu, Nov 21, 2019 at 05:34:48PM +0100, Christian Zigotzky wrote:
> I modified the patch and compiled a new RC8 of kernel 5.4 today. (patch 
> attached)
>
> We have to wait to Rolands test results with his SCSI PCI card. I tested it 
> today but my TV card doesn't work with this patch.

I think we have two sorta overlapping issues here.  One is that I think
we need the bus_dma_limit, which should mostly help for something like
a SCSI controller that doesn't need streaming mappings (btw, do we
have more details on that somewhere?).

And something weird with the videobuf things.  Your change of the dma
masks suggests that the driver doesn't do the right allocations and thus
hits bounce buffering (swiotlb).  We should fix that for real, but the
fact that the bounce buffering itself also fails is even more interesting.

Can you try this git branch:

    git://git.infradead.org/users/hch/misc.git fsl-dma-debugging

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/fsl-dma-debugging

and send me the dmesg with that with your TV adapter?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
