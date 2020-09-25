Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C683A2781B5
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 09:34:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 706A08758A;
	Fri, 25 Sep 2020 07:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVVEX3niVtaG; Fri, 25 Sep 2020 07:34:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6EF2B8744F;
	Fri, 25 Sep 2020 07:34:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 612F7C1AD6;
	Fri, 25 Sep 2020 07:34:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAC19C0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 07:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B97D386BC9
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 07:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msBqdLBThxnn for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 07:34:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AAC1086BBD
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 07:34:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DDC0A321; Fri, 25 Sep 2020 09:34:24 +0200 (CEST)
Date: Fri, 25 Sep 2020 09:34:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH V7 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20200925073423.GT27174@8bytes.org>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
 <20200924172148.GA85236@otc-nc-03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924172148.GA85236@otc-nc-03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will.deacon@arm.com>, iommu@lists.linux-foundation.org,
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

Hi Ashok,

On Thu, Sep 24, 2020 at 10:21:48AM -0700, Raj, Ashok wrote:
> Just trying to followup on this series.
> 
> Sai has moved out of Intel, hence I'm trying to followup on his behalf.
> 
> Let me know if you have queued this for the next release.

Not yet, but I think this is mostly ready. Can you please send a new
version in a new mail thread so that I can pick it up with b4?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
