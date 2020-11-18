Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108F2B7E97
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 14:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB0628701C;
	Wed, 18 Nov 2020 13:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgktGoPeIi3W; Wed, 18 Nov 2020 13:52:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AED187227;
	Wed, 18 Nov 2020 13:52:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41B3DC07FF;
	Wed, 18 Nov 2020 13:52:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F222C07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5BCDE86888
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqDg33OULQaJ for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 13:52:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D561586847
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:52:31 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8218206E0;
 Wed, 18 Nov 2020 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605707551;
 bh=xj8NbNE+HyrB9tavSp9K+rio+c+vo4AcNR7OWbh+Bkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J3eIQP2+C8LFsPooY9WzNwT9tIZLzVN4eEblOc3GE8ddL+kusGEFmrY0uIDypsJki
 5WKP8bxm3Du7tUZ/FF6zL/rU0b99zVDh+kdpufIZ8neczAG4cwnZzkby5KZeXt6aCn
 6bCdgYI/OC8L3OVz2ntwa8s1F2o5vxBSRLdtnFfo=
Date: Wed, 18 Nov 2020 13:52:26 +0000
From: Will Deacon <will@kernel.org>
To: Ashok Raj <ashok.raj@intel.com>, robin.murphy@arm.com
Subject: Re: [Patch V8 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20201118135225.GC2177@willie-the-truck>
References: <20200925190620.18732-1-ashok.raj@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925190620.18732-1-ashok.raj@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will.deacon@arm.com>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
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

On Fri, Sep 25, 2020 at 12:06:17PM -0700, Ashok Raj wrote:
> Presently, the default domain of an iommu group is allocated during boot time
> and it cannot be changed later. So, the device would typically be either in
> identity (pass_through) mode or the device would be in DMA mode as long as the
> system is up and running. There is no way to change the default domain type
> dynamically i.e. after booting, a device cannot switch between identity mode and
> DMA mode.
> 
> Assume a use case wherein the privileged user would want to use the device in
> pass-through mode when the device is used for host so that it would be high
> performing. Presently, this is not supported. Hence add support to change the
> default domain of an iommu group dynamically.
> 
> Support this by writing to a sysfs file, namely
> "/sys/kernel/iommu_groups/<grp_id>/type".
> 
> Testing:
> --------
> Tested by dynamically changing storage device (nvme) from
> 1. identity mode to DMA and making sure file transfer works
> 2. DMA mode to identity mode and making sure file transfer works
> Tested only for intel_iommu/vt-d. Would appreciate if someone could test on AMD
> and ARM based machines.
> 
> Based on iommu maintainer's 'next' branch.

Modulo my minor comments, I think this looks good for 5.11 if you can
please send a version 9.

Robin -- please can you give it the once-over too? I think root can break
things quite badly with this interface, but root can do that in other ways
anyway...

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
