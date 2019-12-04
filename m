Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE9112619
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 09:56:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CC42C2041D;
	Wed,  4 Dec 2019 08:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTMY7rtp9Y3h; Wed,  4 Dec 2019 08:56:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 112C520365;
	Wed,  4 Dec 2019 08:56:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03EA6C18DD;
	Wed,  4 Dec 2019 08:56:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05B1FC18DD
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 08:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E20A320130
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 08:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE6Bp0w7Isbr for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 08:56:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 3229E2041D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 08:56:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A08A768BFE; Wed,  4 Dec 2019 09:56:34 +0100 (CET)
Date: Wed, 4 Dec 2019 09:56:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI
 board installed, unless RAM size limited to 3500M
Message-ID: <20191204085634.GA25929@lst.de>
References: <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
 <4681f5fe-c095-15f5-9221-4b55e940bafc@xenosoft.de>
 <20191126164026.GA8026@lst.de> <20191127065624.GB16913@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127065624.GB16913@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
 mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, nsaenzjulienne@suse.de
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

On Wed, Nov 27, 2019 at 08:56:25AM +0200, Mike Rapoport wrote:
> On Tue, Nov 26, 2019 at 05:40:26PM +0100, Christoph Hellwig wrote:
> > On Tue, Nov 26, 2019 at 12:26:38PM +0100, Christian Zigotzky wrote:
> > > Hello Christoph,
> > >
> > > The PCI TV card works with your patch! I was able to patch your Git kernel 
> > > with the patch above.
> > >
> > > I haven't found any error messages in the dmesg yet.
> > 
> > Thanks.  Unfortunately this is a bit of a hack as we need to set
> > the mask based on runtime information like the magic FSL PCIe window.
> > Let me try to draft something better up, and thanks already for testing
> > this one!
> 
> Maybe we'll simply force bottom up allocation before calling
> swiotlb_init()? Anyway, it's the last memblock allocation.

So I think we should go with this fix (plus a source code comment) for
now.  Revamping the whole memory initialization is going to take a
while, and this fix also is easily backportable.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
