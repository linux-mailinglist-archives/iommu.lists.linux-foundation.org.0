Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F0278CD4
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 17:35:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9956A875F6;
	Fri, 25 Sep 2020 15:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxzHMzee6NKY; Fri, 25 Sep 2020 15:35:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3869C875FC;
	Fri, 25 Sep 2020 15:35:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F154C0051;
	Fri, 25 Sep 2020 15:35:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03300C0051;
 Fri, 25 Sep 2020 15:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E4D6D86E34;
 Fri, 25 Sep 2020 15:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZYSfD2rf7Vm; Fri, 25 Sep 2020 15:34:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9CA7F86E33;
 Fri, 25 Sep 2020 15:34:57 +0000 (UTC)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03C42208B6;
 Fri, 25 Sep 2020 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601048097;
 bh=isVzHZ3nVuZIMD/UCtK27yZnNv9xwKk4e6gsdrwViRE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Q8l1/5txbGVUFYp+yS5jaVgBKf7HBxVWWvn7dssI/T/VnXgtOB3Yh/7ap1pyo1o5L
 68VuRk9wGLg9eN4ujSNKD2a6mD+n9gCRf/V/9MQCib3gQCnjawrnDRi5UXZY5E+uCt
 JGwodDTR2rO5rp3MdsEcOdGztSNeOjeGLARtuDMk=
Date: Fri, 25 Sep 2020 10:34:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 5/6] iommu/virtio: Support topology description in
 config space
Message-ID: <20200925153455.GA2437869@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925081243.GA490533@myrica>
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com, mst@redhat.com,
 linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 bhelgaas@google.com, jasowang@redhat.com
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

On Fri, Sep 25, 2020 at 10:12:43AM +0200, Jean-Philippe Brucker wrote:
> On Thu, Sep 24, 2020 at 10:22:03AM -0500, Bjorn Helgaas wrote:
> > On Fri, Aug 21, 2020 at 03:15:39PM +0200, Jean-Philippe Brucker wrote:

> > > +	/* Perform the init sequence before we can read the config */
> > > +	ret = viommu_pci_reset(common_cfg);
> > 
> > I guess this is some special device-specific reset, not any kind of
> > standard PCI reset?
> 
> Yes it's the virtio reset - writing 0 to the status register in the BAR.

I wonder if this should be named something like viommu_virtio_reset(),
so there's no confusion with PCI resets and all the timing
restrictions, config space restoration, etc. associated with them.

Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
