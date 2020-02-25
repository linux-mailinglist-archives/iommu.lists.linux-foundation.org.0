Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5016EEB0
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 20:10:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0A6185218;
	Tue, 25 Feb 2020 19:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1lIXzsDRoIZ; Tue, 25 Feb 2020 19:10:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C3D085205;
	Tue, 25 Feb 2020 19:10:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33668C0177;
	Tue, 25 Feb 2020 19:10:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0932C0177
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 19:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE03485218
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 19:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoThV6O88vW9 for <iommu@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 19:10:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B59B85205
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/QPdaZH+DsUudIW2GdY/uk6YzgGjD4GCaet27A7iu4Q=; b=a2+ao7c9edC3GjXQUaEmUb/HTT
 hGvinhlKAZkBaIiM4qb96MUs2X0Q4fRunGkB/CeQARPEpMClpLIQKcKBb5rTezSOsV64m559qLGiR
 3saeYmoNvg4raBqUeMGE7xiqMAcXlVqS/pW4goL2Lyd+V3kM0jEELT9iBfsdNnaVd+1qif0otTydH
 TkgO1N1uYu5RFWYaIQ1w+Viu7/I9ta3Dwr1Gt8B6TbdhPWWFwPqtTdIUdhP8zDFwA8BUJUyQOZyAn
 rcb8SQa10L2M87oDjwKIWAZOas6e5R4DhX3dgJfAupdWwyey767howjeF3tzZ/SHDR/eZXWl593m5
 voledIJQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6fbG-0000xA-RV; Tue, 25 Feb 2020 19:10:34 +0000
Date: Tue, 25 Feb 2020 11:10:34 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 2/2] iommu/vt-d: Replace intel SVM APIs with generic SVA
 APIs
Message-ID: <20200225191034.GA29045@infradead.org>
References: <1582586797-61697-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1582586797-61697-4-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582586797-61697-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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

On Mon, Feb 24, 2020 at 03:26:37PM -0800, Jacob Pan wrote:
> This patch is an initial step to replace Intel SVM code with the
> following IOMMU SVA ops:
> intel_svm_bind_mm() => iommu_sva_bind_device()
> intel_svm_unbind_mm() => iommu_sva_unbind_device()
> intel_svm_is_pasid_valid() => iommu_sva_get_pasid()

How did either set APIs end up being added to the kernel without users
to start with?

Please remove both the old intel and the iommu ones given that neither
has any users.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
