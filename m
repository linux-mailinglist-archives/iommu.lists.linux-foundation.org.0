Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 433153B7DCC
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 09:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC40403CD;
	Wed, 30 Jun 2021 07:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCJXbE1xZk15; Wed, 30 Jun 2021 07:02:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F1AEC4011F;
	Wed, 30 Jun 2021 07:02:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AE8FC000E;
	Wed, 30 Jun 2021 07:02:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64D64C000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC864063B
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuO-tM4oD8HM for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 07:02:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C76D40639
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PoknwIAy8Q9q+U6w+2a12vknwq+F35xgmvor8JHbCT0=; b=lhnHlNjmjExRd4kOidxPSUtHCF
 lThr4z+W8p4z9I5Y0rKEDt2xxMBs6nqRsTPYUcwm01rqZGiL6BhwMqG70F9eJyhIh5NUvA1BGqqng
 JVQ4sw5ouU8XKwWoMKDDo/2UQM4xLgLIsJobhS04QOf37hoyxdpTBlTWOa/xRlMM7SvDue9WSLdzw
 dXizTRiFfG3ZU8vVDW6II2yjz1FclnXukf/xHjRSJz4pjnPXinchMsgdHyLWM8lZv6s0EYUqr4/kq
 Uf8NR9mabxA6Qwpt1ElKsJdmFLdqvCWzrLZdJgwPFbYpSkA1aNI8jrMOE1cb4BVyBY4MLZo3/IEZb
 8wWXiC1Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lyUDz-005199-Qi; Wed, 30 Jun 2021 07:01:38 +0000
Date: Wed, 30 Jun 2021 08:01:31 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <YNwWy/j+diR7Y4Iv@infradead.org>
References: <2d1ad075-bec6-bfb9-ce71-ed873795e973@redhat.com>
 <20210607175926.GJ1002214@nvidia.com>
 <fdb2f38c-da1f-9c12-af44-22df039fcfea@redhat.com>
 <20210608131547.GE1002214@nvidia.com>
 <89d30977-119c-49f3-3bf6-d3f7104e07d8@redhat.com>
 <20210608124700.7b9aa5a6.alex.williamson@redhat.com>
 <MWHPR11MB18861A89FE6620921E7A7CAC8C369@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210609115759.GY1002214@nvidia.com>
 <086ca28f-42e5-a432-8bef-ac47a0a6df45@redhat.com>
 <20210609124742.GB1002214@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609124742.GB1002214@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Robin Murphy <robin.murphy@arm.com>,
 Jason Wang <jasowang@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 David Gibson <david@gibson.dropbear.id.au>
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

On Wed, Jun 09, 2021 at 09:47:42AM -0300, Jason Gunthorpe wrote:
> I can vaugely understand this rational for vfio, but not at all for
> the platform's iommu driver, sorry.

Agreed.  More importantly the dependency is not for the platform iommu
driver but just for the core iommu code, which is always built in if
enabled.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
