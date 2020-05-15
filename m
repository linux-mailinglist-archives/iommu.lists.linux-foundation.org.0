Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3521D54F5
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 17:44:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4347789A82;
	Fri, 15 May 2020 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQiYxsMtM+kb; Fri, 15 May 2020 15:43:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A297489A7B;
	Fri, 15 May 2020 15:43:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 942FDC016F;
	Fri, 15 May 2020 15:43:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5916BC016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 470E489A7D
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Y4b9K1cAQcQ for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:43:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2BEAC89A7B
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BjsvnKmgLtuX+mwy7iZ0Hc2xoPJhHClDJ9oKI8T01Ec=; b=Yrd6nYC8k4cK9PpxgDftcC4dfg
 9Px+9LjhYk7LVdANR2rgAUg0/IuV/QWlGTx+cqQPC88JXWay2HP3TMaIqyhMiHf0Qo1wU3DmJnw6J
 67Kk1vLGt0YJINJ+22gk/YXFI9w8bbxr4gv1KqQQsoV/9hF8oQWsRaXU6k47Y6AJvmdw6w15W45w2
 4PeeDRN+Fx9XhZyilPxwtPApQzlzsBUddUZfvmIpcspEZcm+WqTHHRVu4VzkwgiEC66ljw5AFhRy5
 dXojjXf721u5sEkGW7sS3iHdvWv0r0esq13SFz0BYIrQFRVS+MEV6T/PiUVK0vPjtd1hf/x4NtSFl
 sdlzzfEQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZcV5-0002Ks-2e; Fri, 15 May 2020 15:43:51 +0000
Date: Fri, 15 May 2020 08:43:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 0/4] PCI, iommu: Factor 'untrusted' check for ATS
 enablement
Message-ID: <20200515154351.GA6546@infradead.org>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515104359.1178606-1-jean-philippe@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: ashok.raj@intel.com, linux-pci@vger.kernel.org, alex.williamson@redhat.com,
 iommu@lists.linux-foundation.org, bhelgaas@google.com, will@kernel.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 robin.murphy@arm.com
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

Can you please lift the untrusted flag into struct device?  It really
isn't a PCI specific concept, and we should not have code poking into
pci_dev all over the iommu code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
