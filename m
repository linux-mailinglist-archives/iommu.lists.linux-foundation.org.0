Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC8226F86D
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:36:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1EB3877C5;
	Fri, 18 Sep 2020 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbXI5H9GV1kG; Fri, 18 Sep 2020 08:36:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C14C877CC;
	Fri, 18 Sep 2020 08:36:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 137BCC0051;
	Fri, 18 Sep 2020 08:36:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C92FC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 309E8877CC
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwyCCECr318x for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:36:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E7AF5877C5
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:36:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CE2BF396; Fri, 18 Sep 2020 10:36:19 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:36:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH] iommu/amd: Fix potential @entry null deref
Message-ID: <20200918083618.GF31590@8bytes.org>
References: <20200910171621.12879-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910171621.12879-1-joao.m.martins@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Thu, Sep 10, 2020 at 06:16:21PM +0100, Joao Martins wrote:
> After commit 26e495f34107 ("iommu/amd: Restore IRTE.RemapEn bit after
> programming IRTE"), smatch warns:
> 
> 	drivers/iommu/amd/iommu.c:3870 amd_iommu_deactivate_guest_mode()
>         warn: variable dereferenced before check 'entry' (see line 3867)
> 
> Fix this by moving the @valid assignment to after @entry has been checked
> for NULL.
> 
> Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Fixes: 26e495f34107 ("iommu/amd: Restore IRTE.RemapEn bit after programming IRTE")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  drivers/iommu/amd/iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied for v5.9, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
