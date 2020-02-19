Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B255416438D
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 12:41:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7219E85E6F;
	Wed, 19 Feb 2020 11:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXhSbk58E24B; Wed, 19 Feb 2020 11:41:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E245385E08;
	Wed, 19 Feb 2020 11:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C031EC1D89;
	Wed, 19 Feb 2020 11:41:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B57AC013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4490B8506F
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP5mHwvxungP for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 644D084EB9
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 11:41:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t3so121432wru.7
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7KmHROk/Pu3uLEn3/2SxZI46IHOQU1//cLTBR6+z/LE=;
 b=WUJKrbrzFy/sy2qsJp7fTAe/VOrbIljeFdqp59wSerauEf8i5OXz4J0jr7NxbX9IH3
 NNohkIKk8nlCf2LywFE+Tp+Ky2f9qqT3C1FYpT17eeNWVKQmbAw8jxBga0QXY9sAXQ/b
 p3Z9SLGUm+DIucZVHfPnrycbWh1ladw9BKhwBqLR4GzNUnjclXY0zSfuBUe2QvOAwDyq
 +OaPvdcgfmofkwrV9IIL1S3whtFBZk9oZmWjylSq+JX7DJeaZWwaPN3cbm4cuMIxEHVz
 lLCmTx/F9nk87DFyTRPe88XFGB8RHPjXFhMqZhx5I8lhBE0rvUpo0PoMEYKxI1XZbLNn
 cv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7KmHROk/Pu3uLEn3/2SxZI46IHOQU1//cLTBR6+z/LE=;
 b=f7Ply/EFST111zol/oXuCRjkvBjGdzXZyrK/3qpdVvUCV8EqR3LS9F1ccA6a56ozB4
 EaSWM5CxKZVH8clpmhgT9B1SqnK2qWpqLsY9JqjztXreX+q2SZBuZTvJQyBSdKsbpcg7
 wD/ewqwuDnw4tAGiuW9Verx5q4XTvDt9H1obHmGx9cQhIaCucGDu5Q0e/xjz1BWKwvpT
 BRwtBuxxEz2qbXVv5A3JRkyN52Ng45nNvK/90LvhdZAmCBbG6vTbanY/MQ2z7vyQQkJx
 WhX0n/ml+ici64ZUs26aCwa2APvHaXQvAqkp9Unv2eQUUdTNxOdVNekN8XnqMV3Xz5zf
 PkzA==
X-Gm-Message-State: APjAAAXKOkhpsyYdR3BEKFKgn8TO5i9AiUoDwNOmzTc/QmRCRJOx0t2A
 AiwXl+uI9/HKqBVsGeOPYo6Nv1fwko8=
X-Google-Smtp-Source: APXvYqxD5lwbhqsRdA1OEyTadbDFXGtbvDGbouOM54QiYfpWsh+wkqqwg5Yf0w334p1j8aioO4lCTg==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr35017844wrr.268.1582112500664; 
 Wed, 19 Feb 2020 03:41:40 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id z6sm2563269wrs.96.2020.02.19.03.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 03:41:39 -0800 (PST)
Date: Wed, 19 Feb 2020 12:41:33 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/virtio: Build virtio-iommu as module
Message-ID: <20200219114133.GA156984@myrica>
References: <20200214163827.1606668-1-jean-philippe@linaro.org>
 <20200219111604.GH1961@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219111604.GH1961@8bytes.org>
Cc: iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
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

On Wed, Feb 19, 2020 at 12:16:04PM +0100, Joerg Roedel wrote:
> On Fri, Feb 14, 2020 at 05:38:27PM +0100, Jean-Philippe Brucker wrote:
> > From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > 
> > Now that the infrastructure changes are in place, enable virtio-iommu to
> > be built as a module. Remove the redundant pci_request_acs() call, since
> > it's not exported but is already invoked during DMA setup.
> 
> Which infrastructure changes do you mean? Does this depend on the x86
> enablement patch-set in any way?

No, I meant Will's changes in 5.6 to make the SMMU drivers modular. This
patch doesn't depend on the x86 enablement patch-set, but there is a small
conflict in Kconfig since they both modify it (locally I have this patch
applied on top of the x86 enablement).

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
