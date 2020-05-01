Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B98061C1172
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 13:24:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6675D88CE3;
	Fri,  1 May 2020 11:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bydO0mm1-TiR; Fri,  1 May 2020 11:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED32688CE1;
	Fri,  1 May 2020 11:23:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4048C016F;
	Fri,  1 May 2020 11:23:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDD71C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A809B2604C
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzU-zMEtVjS4 for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 11:23:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 0845D203F3
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:23:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EF8D93A4; Fri,  1 May 2020 13:23:53 +0200 (CEST)
Date: Fri, 1 May 2020 13:23:52 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] iommu: Free fwspec with the dev_iommu object
Message-ID: <20200501112352.GB18423@8bytes.org>
References: <20200422135513.617599-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422135513.617599-1-jean-philippe@linaro.org>
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

Hi Jean-Philippe,

On Wed, Apr 22, 2020 at 03:55:14PM +0200, Jean-Philippe Brucker wrote:
> Fix this leak by freeing the fwspec in dev_iommu_free().
> 
> Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2b471419e26c3..54757c404866c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -170,6 +170,7 @@ static struct dev_iommu *dev_iommu_get(struct device *dev)
>  
>  static void dev_iommu_free(struct device *dev)
>  {
> +	iommu_fwspec_free(dev);
>  	kfree(dev->iommu);
>  	dev->iommu = NULL;
>  }

Sorry, but [1] is already queued.

Thanks,

	Joerg

[1] https://lore.kernel.org/r/20200402143749.40500-1-haokexin@gmail.com

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
