Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 280BA1A220E
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:31:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2D31880C5;
	Wed,  8 Apr 2020 12:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwEz89rx8S59; Wed,  8 Apr 2020 12:31:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A893B8809E;
	Wed,  8 Apr 2020 12:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FE26C1D89;
	Wed,  8 Apr 2020 12:31:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 741ACC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5894020535
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwIA0jDqmM3G for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:31:10 +0000 (UTC)
X-Greylist: delayed 00:07:49 by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by silver.osuosl.org (Postfix) with ESMTPS id E9B0420450
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:31:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200408122317euoutp023dc490de9ea03e8963d2227bb880220a~D16UhjiKq2446024460euoutp02c
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:23:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200408122317euoutp023dc490de9ea03e8963d2227bb880220a~D16UhjiKq2446024460euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586348598;
 bh=C6hOGADV2N8VHfBhoqvkcY7aLHRGpJSRBFxTuaQ0adc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=eq7YTdEjrPoV1qaEHG3N0Y3STIRTSncARtOyUtO/9JzD+X0KfqPx1deMcS1ku4Vff
 a8Paw9xH5FcpZsscY9L1Qd1KuynvNkDzJjQy2Vx0oeqIfg64pLwDYlx1dLq/nDSNl3
 dX9HHrf3q2lqywK9fiU+ciWroqbteuj4wmzt7yGs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200408122317eucas1p131bb3e9be76ee1155b4bea50e76fba0c~D16UH4SK20693706937eucas1p1d;
 Wed,  8 Apr 2020 12:23:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EC.B6.60698.532CD8E5; Wed,  8
 Apr 2020 13:23:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200408122316eucas1p14d6cdb0b7291316c7825fc6d4373d43e~D16Tl4ECL1118111181eucas1p1V;
 Wed,  8 Apr 2020 12:23:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200408122316eusmtrp16a34672cfea082ba29cf649d44fce50b~D16Tk1AYA2798627986eusmtrp1M;
 Wed,  8 Apr 2020 12:23:16 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-11-5e8dc235c4f6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B7.E3.07950.432CD8E5; Wed,  8
 Apr 2020 13:23:16 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200408122315eusmtip1e5b8980e40ac1be62aedae60a4eacaed~D16SVJetc3016230162eusmtip10;
 Wed,  8 Apr 2020 12:23:15 +0000 (GMT)
Subject: Re: [RFC PATCH 31/34] iommu/exynos: Create iommu_device in struct
 exynos_iommu_owner
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Gerald
 Schaefer <gerald.schaefer@de.ibm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
Date: Wed, 8 Apr 2020 14:23:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407183742.4344-32-joro@8bytes.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURTHuXtnZ0ZrZVwtDxYVWwQF+cisCxti0Yehgh7Ul0Brq8k0d5Xd
 tNeH1JVIUdLs5aSbiqmZlbppKlvqopktrqYlW1j4It9amZQVmuv08Nv5/8/v3HP+cFmsLKO9
 2XDdaUGv00SqaFeq8vm0fUOgNTXU77plGbH3/aSIOb2CJrbacYqk38vApHp0kCazvSNyklOr
 JnH32+QkUcyjSNLtUoZkvMyWkSt9I5i0ts7J9NoWhnTUZNGkw/gKkS/ds5ik5RoxudX6TEaS
 voo0SUgMIAO53zGp/9QvJ9M1JooUtphoktgVGOzN99ebZHyJqQTx9b1Wmq8W3zO8uWg9X16c
 RPNdnRaaNzXv4835F/kMRyHiU43jNP+k04R5s+0CP1m+Yq/bIdetx4XI8FhB7xt0xPXkW1Md
 ijb6nK2zDDJxqHFNMnJhgdsE8eK4LBm5skquCMFMpw1J4iuCj5mzlCQmEVSOXKP/jlT0fPlD
 FSIwP+hmJDGB4HnxO7mT8uAOw1jeDHY2PLlvFOQ0VswLzDlkUDBRzjgpmvOH5LHk+XcVXBC8
 v1E19y7LUtwa6KvUOu0lXAjYex1yCXGH5sx+yom4cIFwuX0ewdxKeDKWhaXaC97135kPBNwo
 C9P5w4x09g4QWzpkUu0Bw02P//jLwZaRQkkDRgQ99geMJFIQdCTcQhKlhi77D9q5GXPr4FGN
 r2RvgyZ7LuO0gXMDx5i7dIQbXK28iSVbAZcvKSV6LYhND/+trW9rx2lIJS5IJi6IIy6II/7f
 m4OoYuQlxBi0YYIhQCec8TFotIYYXZjPsShtOZr7yLaZpqkq9OzXUSviWKRarKizpIYq5ZpY
 wzmtFQGLVZ6KXQlzluK45tx5QR91WB8TKRisaBlLqbwUAXlDIUouTHNaOCUI0YL+b1fGunjH
 oVrH8oLAg1PhtqSU3dca9jd6qyyrTryJVQdnZ01lF+c3H4gw6hqCVjkOjW6Obm9+unTSduam
 3stPGx01NOF/e9CjKH6PZXvpx8LMjREf1mrz2reE+KZbE16n7RbvqvHwTvWO/LOLgg8M7Xvh
 9nlAYFsLyn7cKTm63x5ydfWR1ajNZ1ZFGU5q/NdjvUHzG9B810LEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXbvrtfR4jrfnsyyLn6Smk2deyyTyIJLQZRSH8yXhl7Ucpvs
 bpJFpE5CB5ZipU5baoZlWrFl5kvqBiomunIgVgq+UYYpZYKp5dpagd/+5/z/v8M5cEhMZOUH
 kJlKDatWyrNoQoAPbQ5M7o+wliQfqLYiNDK7gSNzWSuBhnqWcFT2uBxD7V/nCeSYWeCj2p5D
 KO/JWz4qNNTjqLj6uQcqf3OPh27NLmDIZnOWZT3DHsjeUUMgu+4dQMtTDgyV1ukwVGnr5qHi
 FQOBCgrD0ee6nxiyfJvjo7UOI44ah40EKpyQHglg5ixGHtNsbAaMZcZKMO2GSQ/G/CiEMTUV
 E8zEWBfBGAfPMOaG60z5eCNgSnRLBNM2ZsQY89BV5odp9+ntCeJotUqrYfdkqDjNYfq8BIWJ
 JVFIHBYRJZaEy5IOhknp0JjoNDYrM4dVh8ZcEGe8N/aCbJ34cm/XvEce6AvWA08SUhGwdXoZ
 6IGAFFEPAez/ts5zG4Fw8G4e36294a8xPeEOLQJoXykFLsObSoGL9ZuYy/ChNnDYMN5JuAyM
 GufBvkY/N2EC8EHJa8xlEJQE6hf1f0NCKgZO3n3lnESSOBUMZ18qXG1fKgne0nUCd8QLDlbN
 4a6IJyWFRaMK9/hIaDRPY24dBNsWa/5pf/hh7j6vFIgMW2jDFsSwBTFsQWoB3gR8WC2nSFdw
 YWJOruC0ynRxqkphAs7/edm/9sK56VK8FVAkoLcJe7tKkkV8eQ6Xq7ACSGK0j/BkgbMlTJPn
 XmHVqhS1NovlrEDqPK0MC/BNVTm/UalJkUglMhQlkYXLwiMR7S8soiyJIipdrmEvsWw2q/7P
 8UjPgDxganY0dser76zVjS4n2LpjfsevVkyZKgcdF+njx6r2HfdsWT600FmkjB1p0D71PZuf
 dq2mdafAz2wnHHGCo8E7vJJORHxUZd4GQW0D8EaDvCJ7dv2T//DEzQt0rFkQWie1FPBO5ez6
 BUHgmt22MW4Zzk9c/f7lasveadszZdw5Gucy5JIQTM3J/wCebPzxVQMAAA==
X-CMS-MailID: 20200408122316eucas1p14d6cdb0b7291316c7825fc6d4373d43e
X-Msg-Generator: CA
X-RootMTR: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
References: <20200407183742.4344-1-joro@8bytes.org>
 <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
 <20200407183742.4344-32-joro@8bytes.org>
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
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

Hi Joerg,

On 07.04.2020 20:37, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
>
> The 'struct exynos_iommu_owner' is an umbrella for multiple SYSMMU
> instances attached to one master. As such all these instances are
> handled the same, they are all configured with the same iommu_domain,
> for example.
>
> The IOMMU core code expects each device to have only one IOMMU
> attached, so create the IOMMU-device for the umbrella instead of each
> hardware SYSMMU.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/exynos-iommu.c | 96 +++++++++++++++++++++++++++---------
>   1 file changed, 73 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 186ff5cc975c..86ecccbf0438 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -235,6 +235,8 @@ struct exynos_iommu_owner {
>   	struct list_head controllers;	/* list of sysmmu_drvdata.owner_node */
>   	struct iommu_domain *domain;	/* domain this device is attached */
>   	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
> +
> +	struct iommu_device iommu;	/* IOMMU core handle */
>   };
>   
>   /*
> @@ -274,8 +276,6 @@ struct sysmmu_drvdata {
>   	struct list_head owner_node;	/* node for owner controllers list */
>   	phys_addr_t pgtable;		/* assigned page table structure */
>   	unsigned int version;		/* our version */
> -
> -	struct iommu_device iommu;	/* IOMMU core handle */
>   };
>   
>   static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
> @@ -625,18 +625,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>   	data->sysmmu = dev;
>   	spin_lock_init(&data->lock);
>   
> -	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
> -				     dev_name(data->sysmmu));
> -	if (ret)
> -		return ret;
> -
> -	iommu_device_set_ops(&data->iommu, &exynos_iommu_ops);
> -	iommu_device_set_fwnode(&data->iommu, &dev->of_node->fwnode);

The iommu_device_set_fwnode() call is lost during this conversion, what breaks driver operation. Most of the above IOMMU fw calls you have moved to xlate function. I've checked briefly but it looks that there is a chicken-egg problem here. The owner structure is allocated and initialized from of_xlate(), which won't be called without linking the problem iommu structure with the fwnode first, what might be done only in sysmmu_probe(). I will check how to handle this in a different way.

> -
> -	ret = iommu_device_register(&data->iommu);
> -	if (ret)
> -		return ret;
> -
>   	platform_set_drvdata(pdev, data);
>   
>   	__sysmmu_get_version(data);
> @@ -1261,6 +1249,8 @@ static int exynos_iommu_add_device(struct device *dev)
>   	}
>   	iommu_group_put(group);
>   
> +	iommu_device_link(&owner->iommu, dev);
> +
>   	return 0;
>   }
>   
> @@ -1282,18 +1272,82 @@ static void exynos_iommu_remove_device(struct device *dev)
>   			iommu_group_put(group);
>   		}
>   	}
> +	iommu_device_unlink(&owner->iommu, dev);
>   	iommu_group_remove_device(dev);
>   
>   	list_for_each_entry(data, &owner->controllers, owner_node)
>   		device_link_del(data->link);
>   }
>   
> +static int exynos_iommu_device_init(struct exynos_iommu_owner *owner)
> +{
> +	static u32 counter = 0;
> +	int ret;
> +
> +	/*
> +	 * Create a virtual IOMMU device. In reality it is an umbrella for a
> +	 * number of SYSMMU platform devices, but that also means that any
> +	 * master can have more than one real IOMMU device. This drivers handles
> +	 * all the real devices for one master synchronously, so they appear as
> +	 * one anyway.
> +	 */
> +	ret = iommu_device_sysfs_add(&owner->iommu, NULL, NULL,
> +				     "sysmmu-owner-%d", counter++);
> +	if (ret)
> +		return ret;
> +
> +	iommu_device_set_ops(&owner->iommu, &exynos_iommu_ops);
> +
> +	return 0;
> +}
> +
> +static void exynos_iommu_device_remove(struct exynos_iommu_owner *owner)
> +{
> +	iommu_device_set_ops(&owner->iommu, NULL);
> +	iommu_device_sysfs_remove(&owner->iommu);
> +}
> +
> +static int exynos_owner_init(struct device *dev)
> +{
> +	struct exynos_iommu_owner *owner = dev->archdata.iommu;
> +	int ret;
> +
> +	if (owner)
> +		return 0;
> +
> +	owner = kzalloc(sizeof(*owner), GFP_KERNEL);
> +	if (!owner)
> +		return -ENOMEM;
> +
> +	ret = exynos_iommu_device_init(owner);
> +	if (ret)
> +		goto out_free_owner;
> +
> +	ret = iommu_device_register(&owner->iommu);
> +	if (ret)
> +		goto out_remove_iommu_device;
> +
> +	INIT_LIST_HEAD(&owner->controllers);
> +	mutex_init(&owner->rpm_lock);
> +	dev->archdata.iommu = owner;
> +
> +	return 0;
> +
> +out_remove_iommu_device:
> +	exynos_iommu_device_remove(owner);
> +out_free_owner:
> +	kfree(owner);
> +
> +	return ret;
> +}
> +
>   static int exynos_iommu_of_xlate(struct device *dev,
>   				 struct of_phandle_args *spec)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
>   	struct sysmmu_drvdata *data, *entry;
> +	struct exynos_iommu_owner *owner;
> +	int ret;
>   
>   	if (!sysmmu)
>   		return -ENODEV;
> @@ -1302,15 +1356,11 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   	if (!data)
>   		return -ENODEV;
>   
> -	if (!owner) {
> -		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
> -		if (!owner)
> -			return -ENOMEM;
> +	ret = exynos_owner_init(dev);
> +	if (ret)
> +		return ret;
>   
> -		INIT_LIST_HEAD(&owner->controllers);
> -		mutex_init(&owner->rpm_lock);
> -		dev->archdata.iommu = owner;
> -	}
> +	owner = dev->archdata.iommu;
>   
>   	list_for_each_entry(entry, &owner->controllers, owner_node)
>   		if (entry == data)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
