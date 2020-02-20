Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2D1662F7
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 17:31:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E5DFD86797;
	Thu, 20 Feb 2020 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qo4WmKjKNo3U; Thu, 20 Feb 2020 16:31:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6132985DB1;
	Thu, 20 Feb 2020 16:31:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39289C1D8E;
	Thu, 20 Feb 2020 16:31:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0B92C013E;
 Thu, 20 Feb 2020 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BBE8785D3A;
 Thu, 20 Feb 2020 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oD9jkA968iLI; Thu, 20 Feb 2020 16:31:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 708BE85C97;
 Thu, 20 Feb 2020 16:31:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 07B1C68BFE; Thu, 20 Feb 2020 17:31:36 +0100 (CET)
Date: Thu, 20 Feb 2020 17:31:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/2] mm: move force_dma_unencrypted() to mem_encrypt.h
Message-ID: <20200220163135.GA13192@lst.de>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-2-pasic@linux.ibm.com> <20200220161146.GA12709@lst.de>
 <4369f099-e4e4-4a58-b38b-642cf53ccca6@de.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4369f099-e4e4-4a58-b38b-642cf53ccca6@de.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux-foundation.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Thu, Feb 20, 2020 at 05:23:20PM +0100, Christian Borntraeger wrote:
> >From a users perspective it makes absolutely perfect sense to use the
> bounce buffers when they are NEEDED. 
> Forcing the user to specify iommu_platform just because you need bounce buffers
> really feels wrong. And obviously we have a severe performance issue
> because of the indirections.

The point is that the user should not have to specify iommu_platform.
We need to make sure any new hypervisor (especially one that might require
bounce buffering) always sets it, as was a rather bogus legacy hack
that isn't extensibe for cases that for example require bounce buffering.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
