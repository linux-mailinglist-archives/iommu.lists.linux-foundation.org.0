Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30411B3BE
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 16:44:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60A6A869E1;
	Wed, 11 Dec 2019 15:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KY_Rz2q1UWCN; Wed, 11 Dec 2019 15:44:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E1B4C85ECE;
	Wed, 11 Dec 2019 15:44:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAC2BC0881;
	Wed, 11 Dec 2019 15:44:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB75AC1796
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BA040204D1
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjtLGGkxleDZ for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 15:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id C345F1FD42
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:44:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so24527558wrn.7
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 07:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zTeAMitJBFyTpo1SLC9FDWJuZxg2pIG+EP0HCZfhl0I=;
 b=pOLJCHVHJYDyPogESOHu5eSOC0iZmXtd7Moc1RqXnzMeYrkXXT2uJ6MN+GBcjIldDo
 N1NMWAndifJdnJNZujfnuX3xAPYEhliqNfRumigz/7iXep+ev51u+JvMzEFpirxxTht1
 S/lkPoW8wEQd+UFqCafa6uN+m+ws8r2r33fNZjI4C9Jkkbd4mU959c3nooEd1d0rMm72
 nMUdhdjTR7gKaikD2XYXDfm0Hr4zhYNIYfuml8NF6wUeYNZ6HbKRMFNPk8H7celmF9y2
 pLKwPfg3PKXGEhKpXxODcgtOwjUkqFK0SjgxOgYiFnUJiSyFTJToigREJ56mUm80oBcw
 on4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zTeAMitJBFyTpo1SLC9FDWJuZxg2pIG+EP0HCZfhl0I=;
 b=PvJexROAYS4WrDZFwEV4DKYH2ViuG1AuN2GKS3p2JoW4Voq9u7r4Akjf2oLMTKz1Pl
 OUIEJY+bd2qV71/RFJi9rveOxq/FHQCAA3JExW7nNp0YQA4k/zGduG9MzEyAlh1QyQQ9
 L0LT39mapJAkhppK5J8HDAlOZLcDMC/xkcVQcrB1sOeUmQiIlIu+IyTzBVCPFlIEu2Jo
 ZNrq2YGP7qBm5b4JgkdtIQcagMyt6VkQGva5dv0bBKoSl3Jlas9xapf1ybqdhHMt0Ip0
 rDxefOxLmkTm+Xdvl/6ZK0Zgqm53EHGOFlObdM8iW/hjThY24W/xCSQWUe7xdpisl09o
 4OrQ==
X-Gm-Message-State: APjAAAXOYIcbNlliE/FdvUFx0FlHrfNtFwPs2+n53rPd8bQmxQUn+LGh
 CkdQObWiPvZqQ5gVNPNWgkAWEA==
X-Google-Smtp-Source: APXvYqyb4Pp7PLP/3DKnjab13q0ueZ+RiAZW/2+2GzBfRU2szkzvYsUcLcSImdIwSLGU5xpIHlfSTw==
X-Received: by 2002:adf:e591:: with SMTP id l17mr404663wrm.139.1576079059232; 
 Wed, 11 Dec 2019 07:44:19 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id z12sm2693401wmd.16.2019.12.11.07.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 07:44:18 -0800 (PST)
Date: Wed, 11 Dec 2019 16:44:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/5] iommu: virtio: Use iommu_put_resv_regions_simple()
Message-ID: <20191211154416.GA1927@myrica>
References: <20191209145007.2433144-1-thierry.reding@gmail.com>
 <20191209145007.2433144-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209145007.2433144-6-thierry.reding@gmail.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Dec 09, 2019 at 03:50:07PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use the new standard function instead of open-coding it.
> 
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
