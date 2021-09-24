Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E00416BB6
	for <lists.iommu@lfdr.de>; Fri, 24 Sep 2021 08:44:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2DD403A8;
	Fri, 24 Sep 2021 06:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07vNNHiMsGlY; Fri, 24 Sep 2021 06:44:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8CFA4403AF;
	Fri, 24 Sep 2021 06:44:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35530C001E;
	Fri, 24 Sep 2021 06:44:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1A74C000D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 06:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D27783EC7
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 06:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8xnwRObmmCN for <iommu@lists.linux-foundation.org>;
 Fri, 24 Sep 2021 06:44:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC1083E66
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yk37TJ1pv0m2OGjoSFSGGxlGCD0GciEiUSGDQBv+q1U=; b=ExiK0QjAHvn7VukF4+rlC/14Vm
 LC2bgapE+fU1Ac5IN8TOH7oMV+JoT56Q2EMxin+FgHZWhyPvGOovy1m5chiiewrMkZi50AYtvs8iB
 pYFykWdvAjVPdZnO8zNGvYREoJONApQKBAvoldhvcUIXGDxNvgXJFjDxT1h7aYXh7OLq9V0j0mSJE
 xpMrPWN/21I8lYyUIK6h+1Z1pWcC7FyCesrmVbVftrBKyiCG/ZXfEkOyeNrRFw9b3nnBd01G6OeSY
 qh6cZyXTYQxnMVWHZUSRscGikh2QWgRJOEVSELa57arYvW1uwiPhtKx174wgdL3BFb1A0hiwg0D9O
 qncrghsQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mTeuh-006vf6-60; Fri, 24 Sep 2021 06:43:02 +0000
Date: Fri, 24 Sep 2021 07:42:27 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [PATCH v2 9/9] iommu/vt-d: Use pci core's DVSEC functionality
Message-ID: <YU1zU2jn/mGYDThY@infradead.org>
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-10-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923172647.72738-10-ben.widawsky@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-cxl@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Thu, Sep 23, 2021 at 10:26:47AM -0700, Ben Widawsky wrote:
>   */
>  static int siov_find_pci_dvsec(struct pci_dev *pdev)
>  {
> +	return pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_INTEL, 5);
>  }

I hink the siov_find_pci_dvsec helper is pretty pointless now and can be
folded into its only caller.  And independent of that: this capability
really needs a symbolic name.  Especially for a vendor like Intel that
might have a few there should be a list of them somewhere.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
