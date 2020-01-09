Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B550C135B72
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 15:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6388181AEC;
	Thu,  9 Jan 2020 14:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QN5rgUPOdaBL; Thu,  9 Jan 2020 14:34:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9F8681926;
	Thu,  9 Jan 2020 14:34:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4DD5C0881;
	Thu,  9 Jan 2020 14:34:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBC76C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA64681926
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki1dAdKIhAML for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 14:34:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B1FBD816DE
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:34:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 13FDD68C4E; Thu,  9 Jan 2020 15:33:57 +0100 (CET)
Date: Thu, 9 Jan 2020 15:33:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [RFC 3/5] x86/PCI: Expose VMD's device in pci_sysdata
Message-ID: <20200109143356.GB22656@lst.de>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-4-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577823863-3303-4-git-send-email-jonathan.derrick@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On Tue, Dec 31, 2019 at 01:24:21PM -0700, Jon Derrick wrote:
> To be used by intel-iommu code to find the correct domain.

Any reason to prefer this version over my patches 2 and 3 from the
series in August?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
