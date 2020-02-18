Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEA162F75
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 20:11:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 046B4863B7;
	Tue, 18 Feb 2020 19:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0V3LWpyIgeG; Tue, 18 Feb 2020 19:11:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F514863A3;
	Tue, 18 Feb 2020 19:11:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ED31C013E;
	Tue, 18 Feb 2020 19:11:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAD6AC013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D985185A60
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJMpraHvog_P for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 19:11:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AC3EC859BA
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 19:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582053085;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=5D52tt6mIQclXNRsDvAzprjKbRWFDl8iC2bcJ4uR/M8=;
 b=FNaMcY/qPwUuRcd32jJxYRIX/roCqdjUYmbEfAptYtoFWF/rZnZFv3XbaRceiuz7g9
 KshwNOBpbbNaNJUQhv21kDQrbwah8QqFdnK5AcqA3tJHUWq7BCQMbp8EzFtITz5gtCoY
 JJj3N6y2W6etdyxxWt32vSIVtKxf4gcaNww2C1CrWkYGJbmmuiHWZ4o7bieZVon54l1Q
 2Fsn4H4GyBwDDr4GVgBPYcvkqWC8zbNokXF+bdw53UmvikY7R4z0/ExqCRJ8EmtqPge8
 JZ2aMftn7EEqqEBF7BSyisyLR4myXLuzzJVsi3OTqfd8lUXzHfyzd0VpTooMcxLr/MC8
 NWoQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8b7Ic/NaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id a01fe9w1IJ5Mm3U
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Feb 2020 20:05:22 +0100 (CET)
Date: Tue, 18 Feb 2020 20:05:16 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/qcom: Fix bogus detach logic
Message-ID: <20200218190516.GA19773@gerhold.net>
References: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Brian Masney <masneyb@onstation.org>
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

On Tue, Feb 18, 2020 at 06:12:41PM +0000, Robin Murphy wrote:
> Currently, the implementation of qcom_iommu_domain_free() is guaranteed
> to do one of two things: WARN() and leak everything, or dereference NULL
> and crash. That alone is terrible, but in fact the whole idea of trying
> to track the liveness of a domain via the qcom_domain->iommu pointer as
> a sanity check is full of fundamentally flawed assumptions. Make things
> robust and actually functional by not trying to be quite so clever.
> 
> Reported-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

This fixes the warning reported by Naresh Kamboju [1] for me. Thank you!

Tested-by: Stephan Gerhold <stephan@gerhold.net>

[1]: https://lore.kernel.org/linux-arm-msm/CA+G9fYtScOpkLvx=__gP903uJ2v87RwZgkAuL6RpF9_DTDs9Zw@mail.gmail.com/

> ---
>  drivers/iommu/qcom_iommu.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 39759db4f003..4328da0b0a9f 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -344,21 +344,19 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
>  {
>  	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
>  
> -	if (WARN_ON(qcom_domain->iommu))    /* forgot to detach? */
> -		return;
> -
>  	iommu_put_dma_cookie(domain);
>  
> -	/* NOTE: unmap can be called after client device is powered off,
> -	 * for example, with GPUs or anything involving dma-buf.  So we
> -	 * cannot rely on the device_link.  Make sure the IOMMU is on to
> -	 * avoid unclocked accesses in the TLB inv path:
> -	 */
> -	pm_runtime_get_sync(qcom_domain->iommu->dev);
> -
> -	free_io_pgtable_ops(qcom_domain->pgtbl_ops);
> -
> -	pm_runtime_put_sync(qcom_domain->iommu->dev);
> +	if (qcom_domain->iommu) {
> +		/*
> +		 * NOTE: unmap can be called after client device is powered
> +		 * off, for example, with GPUs or anything involving dma-buf.
> +		 * So we cannot rely on the device_link.  Make sure the IOMMU
> +		 * is on to avoid unclocked accesses in the TLB inv path:
> +		 */
> +		pm_runtime_get_sync(qcom_domain->iommu->dev);
> +		free_io_pgtable_ops(qcom_domain->pgtbl_ops);
> +		pm_runtime_put_sync(qcom_domain->iommu->dev);
> +	}
>  
>  	kfree(qcom_domain);
>  }
> @@ -404,7 +402,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>  	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
>  	unsigned i;
>  
> -	if (!qcom_domain->iommu)
> +	if (WARN_ON(!qcom_domain->iommu))
>  		return;
>  
>  	pm_runtime_get_sync(qcom_iommu->dev);
> @@ -417,8 +415,6 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>  		ctx->domain = NULL;
>  	}
>  	pm_runtime_put_sync(qcom_iommu->dev);
> -
> -	qcom_domain->iommu = NULL;
>  }
>  
>  static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -- 
> 2.23.0.dirty
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
