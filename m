Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF201990D4
	for <lists.iommu@lfdr.de>; Tue, 31 Mar 2020 11:15:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16B4D88415;
	Tue, 31 Mar 2020 09:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lL8KNudppBAd; Tue, 31 Mar 2020 09:15:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA672883B8;
	Tue, 31 Mar 2020 09:15:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA112C07FF;
	Tue, 31 Mar 2020 09:15:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 222C7C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 09:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F07E876C2
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 09:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abfq478hT1pc for <iommu@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 09:15:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8771B876B8
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6OrjNgWSgjsVgH6reFO8z2ixicWhI/e5FNsva6w55pc=; b=jpt/K2zABPB39L9L1UfINWG0kU
 a0UjPT+0UTlvycvxpmjj3Mq1U8yayR5ZBsKUzFqvVDicdd32QYL8er5THUVvNLjGiyRPX6Z0kFicC
 0RtlvWV12hqst+lQ525f5GfHeel9HHwSoCjB3llxC5VE7FRMnUyWYu3qe7XgP9eI0W9hp8Eu2kUpr
 uIGgzewZCfwXyV/L98BrMA9AFZVx/7HoQZSCb1RBkCthBzxi4l54KdNjQIi9AwIge4lH74tkMMEBb
 6yoBbH1EnjdQJDw9b98IH3iFRCgGvJZo/BoFJ3FRlm4BIngrmV638qrHeyqKdgUce/pjZXG2YKzTj
 7sCTm1RA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jJCzF-0004Sr-Ij; Tue, 31 Mar 2020 09:15:09 +0000
Date: Tue, 31 Mar 2020 02:15:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Message-ID: <20200331091509.GA12040@infradead.org>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-2-git-send-email-yi.l.liu@intel.com>
 <20200331075331.GA26583@infradead.org>
 <A2975661238FB949B60364EF0F2C25743A21A9BB@SHSMSX104.ccr.corp.intel.com>
 <A2975661238FB949B60364EF0F2C25743A21A9ED@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A21A9ED@SHSMSX104.ccr.corp.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Tian,
 Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Tue, Mar 31, 2020 at 08:36:32AM +0000, Liu, Yi L wrote:
> > From: Liu, Yi L
> > Sent: Tuesday, March 31, 2020 4:33 PM
> > To: 'Christoph Hellwig' <hch@infradead.org>
> > Subject: RE: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
> > 
> > > From: Christoph Hellwig <hch@infradead.org>
> > > Sent: Tuesday, March 31, 2020 3:54 PM
> > > To: Liu, Yi L <yi.l.liu@intel.com>
> > > Subject: Re: [PATCH v1 1/8] vfio: Add
> > > VFIO_IOMMU_PASID_REQUEST(alloc/free)
> > >
> > > Who is going to use thse exports?  Please submit them together with a
> > > driver actually using them.
> the user of the symbols are already in this patch. sorry for the split answer..

Thanks, sorry for the noise!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
