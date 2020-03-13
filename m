Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EE18485C
	for <lists.iommu@lfdr.de>; Fri, 13 Mar 2020 14:41:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D046927255;
	Fri, 13 Mar 2020 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzREiXOtXCMb; Fri, 13 Mar 2020 13:41:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34B89272E8;
	Fri, 13 Mar 2020 13:41:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22DDAC0177;
	Fri, 13 Mar 2020 13:41:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18DC9C0177
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 13:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 02D8587F43
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 13:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmV28nf3aBCl for <iommu@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:41:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8FE0887F40
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 13:41:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9674E269; Fri, 13 Mar 2020 14:41:03 +0100 (CET)
Date: Fri, 13 Mar 2020 14:41:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PULL REQUEST] iommu/vt-d: fixes for v5.6
Message-ID: <20200313134102.GP3794@8bytes.org>
References: <20200312060955.8523-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312060955.8523-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Thu, Mar 12, 2020 at 02:09:53PM +0800, Lu Baolu wrote:
> Hi Joerg,
> 
> There are another two small fixes queued in my tree.
> 
> Can you please consider them for v5.6?
> 
> Best regards,
> -baolu
> 
> Daniel Drake (1):
>   iommu/vt-d: Ignore devices with out-of-spec domain number
> 
> Zhenzhong Duan (1):
>   iommu/vt-d: Fix the wrong printing in RHSA parsing
> 
>  drivers/iommu/dmar.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied for v5.6, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
