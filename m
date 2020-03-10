Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4417F57F
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 11:58:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49997883C6;
	Tue, 10 Mar 2020 10:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyW6xx25m5BX; Tue, 10 Mar 2020 10:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA7F0882EA;
	Tue, 10 Mar 2020 10:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9862EC1D8E;
	Tue, 10 Mar 2020 10:58:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D40C9C0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BC72A882EA
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1+5RzGnAVvG0 for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 10:58:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 193E7883BF
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:58:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 73287364; Tue, 10 Mar 2020 11:58:15 +0100 (CET)
Date: Tue, 10 Mar 2020 11:58:14 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] iommu/vt-d: Don't force 32bit devices to uses DMA
 domain
Message-ID: <20200310105813.GE3794@8bytes.org>
References: <20200307062014.3288-1-baolu.lu@linux.intel.com>
 <20200307062014.3288-4-baolu.lu@linux.intel.com>
 <20200307142144.GB26190@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307142144.GB26190@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

On Sat, Mar 07, 2020 at 03:21:44PM +0100, Christoph Hellwig wrote:
> Can we add a new AUTO domain which will allow using the identity
> mapping when available?  That somewhat matches the existing x86
> default, and also what powerpc does.  I have a series to lift
> that bypass mode into the core dma-mapping code that I need
> to repost, which I think would be suitable for intel-iommu as well.

Please Cc me on that series when you re-post it.


Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
