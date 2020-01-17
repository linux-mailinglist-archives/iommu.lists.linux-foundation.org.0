Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64B140739
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 11:00:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E75A586CDB;
	Fri, 17 Jan 2020 10:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prW-sW8KAV6y; Fri, 17 Jan 2020 10:00:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B500984EB9;
	Fri, 17 Jan 2020 10:00:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B2E0C077D;
	Fri, 17 Jan 2020 10:00:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88649C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76F9E863FD
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVB6UZmXXaKq for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:59:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8759085B29
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 09:59:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AA481327; Fri, 17 Jan 2020 10:59:55 +0100 (CET)
Date: Fri, 17 Jan 2020 10:59:54 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Remove unnecessary WARN_ON_ONCE()
Message-ID: <20200117095953.GB15760@8bytes.org>
References: <20200116015236.4458-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116015236.4458-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, kevin.tian@intel.com, ashok.raj@intel.com,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

On Thu, Jan 16, 2020 at 09:52:36AM +0800, Lu Baolu wrote:
> Address field in device TLB invalidation descriptor is qualified
> by the S field. If S field is zero, a single page at page address
> specified by address [63:12] is requested to be invalidated. If S
> field is set, the least significant bit in the address field with
> value 0b (say bit N) indicates the invalidation address range. The
> spec doesn't require the address [N - 1, 0] to be cleared, hence
> remove the unnecessary WARN_ON_ONCE().
> 
> Otherwise, the caller might set "mask = MAX_AGAW_PFN_WIDTH" in order
> to invalidating all the cached mappings on an endpoint, and below
> overflow error will be triggered.
> 
> [...]
> UBSAN: Undefined behaviour in drivers/iommu/dmar.c:1354:3
> shift exponent 64 is too large for 64-bit type 'long long unsigned int'
> [...]
> 
> Reported-and-tested-by: Frank <fgndev@posteo.de>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Does this need a Fixes and/or stable tag?


Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
