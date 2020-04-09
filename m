Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2531A38DE
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 19:26:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFF7986B12;
	Thu,  9 Apr 2020 17:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpsL-eZuzx4t; Thu,  9 Apr 2020 17:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3DB486AE3;
	Thu,  9 Apr 2020 17:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE517C1D89;
	Thu,  9 Apr 2020 17:26:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05F20C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 15:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E3EB087BCA
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sm-cQ2V1io58 for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 15:52:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B5F9873DC
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 15:52:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k1so12537387wrm.3
 for <iommu@lists.linux-foundation.org>; Thu, 09 Apr 2020 08:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eqkR8PSND6qViZd9vmRT63/nOL3pGElbecF9kS9AV5s=;
 b=V/MlLEOrhKtaFgXlDU1DQNRN+fdUjkU9al0D7dtjZYPDFeyS0eFf12YzIyxLEdqa8t
 8zo8/BaqrF3xTaeRTQDBDQKfoRZ4iOH3wMisf53moEkHOXg/oOKpkya10Sjb8r1QlI8F
 +pjLdmGisXtsBfjKZ8em/qzwewK8tE9EcE6TLPZcjddx9yApM3WV+zQ2eOIoSkSFnzWW
 NfrS0ZLcnswWkfTQS3VZ6xPwQpnkOm14EcY6cG8NSiSirmEF2embt/f3WFvYS9HD/McF
 7GNi3N2x7dAEHXrvuYLcpen06DPS6TOMx0yA6zLUhaWo0SAe9Zlim7qErAPMyxuROwE9
 MwoQ==
X-Gm-Message-State: AGi0PuZDa+JW6D4Hi1Gw52ATQYCAnWZ+aaX2Z3aqVWyTwwQm/vaQTCyp
 Cy3V67i1Zy6FDPbjNuuq6ZY=
X-Google-Smtp-Source: APiQypKMJHF6OiHO4wdgZ4uGElDczTXQUdaiFhgSzp0EipiSdhIJoRoqAA6vF3j45RxLstvXaIP8Cw==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr13870834wra.98.1586447532733; 
 Thu, 09 Apr 2020 08:52:12 -0700 (PDT)
Received: from debian (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id o13sm18258592wrm.74.2020.04.09.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 08:52:11 -0700 (PDT)
Date: Thu, 9 Apr 2020 16:52:09 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/28] x86/hyperv: use vmalloc_exec for the hypercall page
Message-ID: <20200409155209.4tqaipnwifcsrmda@debian>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-2-hch@lst.de>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Thu, 09 Apr 2020 17:26:42 +0000
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

On Wed, Apr 08, 2020 at 01:58:59PM +0200, Christoph Hellwig wrote:
> Use the designated helper for allocating executable kernel memory, and
> remove the now unused PAGE_KERNEL_RX define.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
