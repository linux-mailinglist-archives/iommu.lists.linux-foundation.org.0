Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E11A758D
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 10:11:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41D64878AF;
	Tue, 14 Apr 2020 08:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4osAvLY+f+HY; Tue, 14 Apr 2020 08:11:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B3658788B;
	Tue, 14 Apr 2020 08:11:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43238C0172;
	Tue, 14 Apr 2020 08:11:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5B1FC0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 08:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0240203DB
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 08:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANqDlgWSsL2S for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 08:11:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 0BA2520035
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O3a96vzOf8hcQ+GezCIAovhsKAxB8eo+WBGQ45KCX08=; b=POeXOIAptoTj/Yv6Ki2m1jlizY
 SxzCLvkF1HNMJqQxXxGYrkEtBQCB86xeql3/X+yfB9OGtIznYp/evwZFEqU6yV9GNXYeHPO77F+LX
 fNLOF1JgUhd0mcQZBLYhSN1utCuvFesLW6jT2Eys1R3rBQOaKkiKIc8msi8jU4aKZJfWihFHrOMZo
 2zdtGfUKzkJF8s86Edb9VhlsK2t2wwhsdtWIKThTMHM6DbncakxX/CVJLtOKHlgqJlOckb8nM8dT5
 SWJOQVoB21dEFVpsaFbTqHfckHB38+JD6flXhIOEUM94Rl1B9QCYnJexQWdNLwuG0DMZPMIe4pUKM
 U6GuOFwA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jOGey-0004qv-0O; Tue, 14 Apr 2020 08:11:08 +0000
Date: Tue, 14 Apr 2020 01:11:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2 1/3] iommu/uapi: Define uapi version and capabilities
Message-ID: <20200414081107.GA7315@infradead.org>
References: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECB45@SHSMSX104.ccr.corp.intel.com>
 <20200327074702.GA27959@infradead.org>
 <20200327165335.397f24a3@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FE150@SHSMSX104.ccr.corp.intel.com>
 <20200330090746.23c5599c@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D8011A9@SHSMSX104.ccr.corp.intel.com>
 <20200331085444.44bee0bb@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D803AFF@SHSMSX104.ccr.corp.intel.com>
 <20200402113604.6eea1e6f@jacob-builder>
 <20200413134157.395981a6@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413134157.395981a6@jacob-builder>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Mon, Apr 13, 2020 at 01:41:57PM -0700, Jacob Pan wrote:
> Hi All,
> 
> Just a gentle reminder, any feedback on the options I listed below? New
> ideas will be even better.
> 
> Christoph, does the explanation make sense to you? We do have the
> capability/flag based scheme for IOMMU API extension, the version is
> mainly used for size lookup. Compatibility checking is another use of
> the version, it makes checking easy when a vIOMMU is launched.

No.  If you truely need different versions use different ioctl
identifiers.  If it really is just the size pass the size and not a
version.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
