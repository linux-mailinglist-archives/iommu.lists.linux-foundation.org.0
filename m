Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F31E3F725F
	for <lists.iommu@lfdr.de>; Wed, 25 Aug 2021 11:55:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DDB605DB;
	Wed, 25 Aug 2021 09:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQS1mOHeUlV7; Wed, 25 Aug 2021 09:55:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6460360642;
	Wed, 25 Aug 2021 09:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24943C0022;
	Wed, 25 Aug 2021 09:55:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18408C000E;
 Wed, 25 Aug 2021 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECF560642;
 Wed, 25 Aug 2021 09:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSvC-pvUtz-A; Wed, 25 Aug 2021 09:55:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BF9A605DB;
 Wed, 25 Aug 2021 09:55:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2CCD61153;
 Wed, 25 Aug 2021 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629885349;
 bh=CJy1cRP3PcwXA1bUMtODTgzMZI8sWPjuw/TQT8Z9LZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kvyuuMxo422V81XfuNsgTXQdG3hm39SW5PhGUrw45JcXygc98vMLozMP82RcUmsQo
 VUzQiTEqRSpp8ROEbWpr2eLfukPTzYOsYlXAzH+2I3FeXxA4V1LP0/apWcvIPS79n7
 qrsG+1wPt2uBqnxJAd0IQ+pHs6jFkO9rUBGLOTvT6JZ81gnP56eu1OgkMI45oeTdBP
 uily1IR3utV4v0wrJpFKIkZtuzLeOrL/4kImeUKsL/yhS3J/BJM/gnvyE6jHdm/d14
 QVgrrOEYeV2MKnO1zmRDCO257vhiuMU9/Aqk45CzK/2+eUiQA2NseRuGvk6JHjudXF
 tl9asW0TnLq5g==
Date: Wed, 25 Aug 2021 10:55:41 +0100
From: Will Deacon <will@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v11 01/12] iova: Export alloc_iova_fast() and
 free_iova_fast()
Message-ID: <20210825095540.GA24546@willie-the-truck>
References: <20210818120642.165-1-xieyongji@bytedance.com>
 <20210818120642.165-2-xieyongji@bytedance.com>
 <20210824140758-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824140758-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 corbet@lwn.net, willy@infradead.org, hch@infradead.org,
 Xie Yongji <xieyongji@bytedance.com>, dan.carpenter@oracle.com,
 sgarzare@redhat.com, xiaodong.liu@intel.com, linux-fsdevel@vger.kernel.org,
 viro@zeniv.linux.org.uk, stefanha@redhat.com, songmuchun@bytedance.com,
 axboe@kernel.dk, zhe.he@windriver.com, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bcrl@kvack.org, netdev@vger.kernel.org,
 joe@perches.com, robin.murphy@arm.com, mika.penttila@nextfour.com
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

On Tue, Aug 24, 2021 at 02:08:33PM -0400, Michael S. Tsirkin wrote:
> On Wed, Aug 18, 2021 at 08:06:31PM +0800, Xie Yongji wrote:
> > Export alloc_iova_fast() and free_iova_fast() so that
> > some modules can make use of the per-CPU cache to get
> > rid of rbtree spinlock in alloc_iova() and free_iova()
> > during IOVA allocation.
> > 
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> 
> 
> This needs ack from iommu maintainers. Guys?

Looks fine to me:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
