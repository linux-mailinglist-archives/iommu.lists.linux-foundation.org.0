Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B152A470A
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 14:56:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57B3C867CE;
	Tue,  3 Nov 2020 13:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkNZ-3VDsD0x; Tue,  3 Nov 2020 13:56:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6DE686C51;
	Tue,  3 Nov 2020 13:56:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCF76C0051;
	Tue,  3 Nov 2020 13:56:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11EDBC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E79BD86C3A
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCbrifSlkFwU for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 13:56:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54527867CE
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:56:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B62C0433; Tue,  3 Nov 2020 14:56:26 +0100 (CET)
Date: Tue, 3 Nov 2020 14:56:25 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] iommu: fix a check in iommu_check_bind_data()
Message-ID: <20201103135625.GK22888@8bytes.org>
References: <20201103101623.GA1127762@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103101623.GA1127762@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jacob Pan <jacob.pan.linux@gmail.com>, kernel-janitors@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On Tue, Nov 03, 2020 at 01:16:23PM +0300, Dan Carpenter wrote:
> The "data->flags" variable is a u64 so if one of the high 32 bits is
> set the original code will allow it, but it should be rejected.  The
> fix is to declare "mask" as a u64 instead of a u32.
> 
> Fixes: d90573812eea ("iommu/uapi: Handle data and argsz filled by users")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.10, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
