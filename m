Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8528FEE0
	for <lists.iommu@lfdr.de>; Fri, 16 Oct 2020 09:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2406388B48;
	Fri, 16 Oct 2020 07:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25QyHYHZxpon; Fri, 16 Oct 2020 07:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 929A088B4C;
	Fri, 16 Oct 2020 07:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 788B5C1AD4;
	Fri, 16 Oct 2020 07:08:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2A89C0051
 for <iommu@lists.linux-foundation.org>; Fri, 16 Oct 2020 07:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6A88204AE
 for <iommu@lists.linux-foundation.org>; Fri, 16 Oct 2020 07:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDz-BhW9lVZ1 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 07:08:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id A82E720491
 for <iommu@lists.linux-foundation.org>; Fri, 16 Oct 2020 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7hDZyCA6qqeFEGjeTlc4gGrS7CvSOlfXIwAkcHsgm2w=; b=k8oyVg7rGOZx44tA0mS5WPKXXs
 C63Oo7WDgn57KNzl4V7otFTkuu/0VbSILsCkheyAWt7GJ8qcgaL8nwAIg3yDJbneC45+q2nuUmtM0
 4Pwep9eEw2kj9CyGrILIpTxHElmf+CGdazQPfLA+ZsO59LzWxIJ8w2hIr/Nrj0EYnhegzYIG/L25T
 fIbRZptfAP10eR46Orq4V5rtGBQnn5GnTipw+Tja6/7EGWefxrx9jr1Ompn1PxcLLEYhkidd7lOLs
 wPhdBf2SQ86kIP/+ewYyX54amShiiaXPdBXob2I4SgPFZYK5fuM9TU/0fC/upkTt9+aOJokhY0NaP
 al55VkQA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kTJqJ-0003Sd-NB; Fri, 16 Oct 2020 07:07:59 +0000
Date: Fri, 16 Oct 2020 08:07:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RFC PATCH 2/2] iommu: Add IOMMU_UNBIND_FAULT_PENDING flag
Message-ID: <20201016070759.GA12905@infradead.org>
References: <20201015090028.1278108-1-jean-philippe@linaro.org>
 <20201015090028.1278108-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015090028.1278108-3-jean-philippe@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: kevin.tian@intel.com, ashok.raj@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 zhangfei.gao@linaro.org, dwmw2@infradead.org,
 linux-accelerators@lists.ozlabs.org
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

On Thu, Oct 15, 2020 at 11:00:29AM +0200, Jean-Philippe Brucker wrote:
> IOMMU drivers only need to flush their PRI queue when faults might be
> pending. According to the PCIe spec (quoted below) this only happens
> when using the "Stop Marker" method. Otherwise the function waits for
> pending faults before signaling to the device driver that it can
> unbind().
> 
> Add the IOMMU_UNBIND_FAULT_PENDING flags to unbind(), to tell the IOMMU
> driver whether it's worth flushing the queue.

As we have no code using the "stop marker" method please just remove
the code entirely instead of adding a flag that is just dead code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
