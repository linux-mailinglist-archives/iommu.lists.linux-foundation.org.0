Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B81AD673
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 08:51:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F1D6B87554;
	Fri, 17 Apr 2020 06:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TF3qng6Y1rZ; Fri, 17 Apr 2020 06:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7153F880C7;
	Fri, 17 Apr 2020 06:51:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39698C1D8D;
	Fri, 17 Apr 2020 06:51:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC392C0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 06:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C740820413
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 06:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2G5wd+DWFn3H for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:50:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 173392014A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 06:50:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 22EAA68BEB; Fri, 17 Apr 2020 08:50:55 +0200 (CEST)
Date: Fri, 17 Apr 2020 08:50:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 1/3] iommu/vt-d: Allow 32bit devices to uses DMA domain
Message-ID: <20200417065054.GA18880@lst.de>
References: <20200416062354.10307-1-baolu.lu@linux.intel.com>
 <20200416062354.10307-2-baolu.lu@linux.intel.com>
 <20200416070102.GA12588@lst.de>
 <e11d8138-f704-2f5e-c0b1-70b367a33d5d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e11d8138-f704-2f5e-c0b1-70b367a33d5d@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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

On Thu, Apr 16, 2020 at 03:40:38PM +0800, Lu Baolu wrote:
>> description.  I'd need to look at the final code, but it seems like
>> this will still cause bounce buffering instead of using dynamic
>> mapping, which still seems like an awful idea.
>
> Yes. If the user chooses to use identity domain by default through
> kernel command, identity domain will be applied for all devices. For
> those devices with limited addressing capability, bounce buffering will
> be used when they try to access the memory beyond their address
> capability. This won't cause any kernel regression as far as I can see.
>
> Switching domain during runtime with drivers loaded will cause real
> problems as I said in the commit message. That's the reason why I am
> proposing to remove it. If we want to keep it, we have to make sure that
> switching domain for one device should not impact other devices which
> share the same domain with it. Furthermore, it's better to implement it
> in the generic layer to keep device driver behavior consistent on all
> architectures.

I don't disagree with the technical points.  What I pointed out is that

 a) the actual technical change is not in the commit log, which it
    should be
 b) that I still think taking away the ability to dynamically map
    devices in the identify domain after all the time we allowed for
    that is going to cause nasty regressions.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
