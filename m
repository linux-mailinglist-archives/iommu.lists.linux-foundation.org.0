Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F410CBD3
	for <lists.iommu@lfdr.de>; Thu, 28 Nov 2019 16:36:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 570B185EF2;
	Thu, 28 Nov 2019 15:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkvcBBC1-IOX; Thu, 28 Nov 2019 15:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74272864B8;
	Thu, 28 Nov 2019 15:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B58EC0881;
	Thu, 28 Nov 2019 15:36:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 931DBC0881
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 15:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DF2686A35
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 15:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xH4ICPKBGh0b for <iommu@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 15:36:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BC8786A2D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 15:36:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5692068B05; Thu, 28 Nov 2019 16:36:46 +0100 (CET)
Date: Thu, 28 Nov 2019 16:36:46 +0100
From: "hch@lst.de" <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Message-ID: <20191128153646.GA29430@lst.de>
References: <20191127144006.25998-1-hch@lst.de>
 <20191127144006.25998-3-hch@lst.de>
 <a95d9115fc2a80de2f97f001bbcd9aba6636e685.camel@vmware.com>
 <20191128075153.GD20659@lst.de>
 <MN2PR05MB6141B6D7E28A146EBF9CE79FA1470@MN2PR05MB6141.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR05MB6141B6D7E28A146EBF9CE79FA1470@MN2PR05MB6141.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
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

On Thu, Nov 28, 2019 at 08:02:16AM +0000, Thomas Hellstrom wrote:
> > We have a hard time handling that in generic code.  Do we have any
> > good use case for SWIOTLB_FORCE not that we have force_dma_unencrypted?
> > I'd love to be able to get rid of it..
> >
> IIRC the justification for it is debugging. Drivers that don't do
> syncing correctly or have incorrect assumptions of initialization of DMA
> memory will not work properly when SWIOTLB is forced. We recently found
> a vmw_pvscsi device flaw that way...

Ok. I guess debugging is reasonable.  Although that means I need
to repsin this quite a bit as I now need a callout to dma_direct.
I'll respin it in the next days.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
