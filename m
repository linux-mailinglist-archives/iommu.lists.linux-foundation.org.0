Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE89B900
	for <lists.iommu@lfdr.de>; Sat, 24 Aug 2019 01:43:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24FE4E35;
	Fri, 23 Aug 2019 23:43:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6493DDD
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 23:43:33 +0000 (UTC)
X-Greylist: delayed 00:36:48 by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D70889E
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 23:43:33 +0000 (UTC)
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1i1Idf-0004su-T5; Fri, 23 Aug 2019 17:06:36 -0600
To: Nadav Amit <namit@vmware.com>, Joerg Roedel <joro@8bytes.org>
References: <20190820085317.29458-1-namit@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e0700e76-c8c5-7052-cf17-81cc7ad76d04@deltatee.com>
Date: Fri, 23 Aug 2019 17:06:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820085317.29458-1-namit@vmware.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: jacob.jun.pan@linux.intel.com, dwmw2@infradead.org,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, joro@8bytes.org,
	namit@vmware.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
Subject: Re: [PATCH] iommu/vt-d: Fix wrong analysis whether devices share the
	same bus
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 2019-08-20 2:53 a.m., Nadav Amit wrote:
> set_msi_sid_cb() is used to determine whether device aliases share the
> same bus, but it can provide false indications that aliases use the same
> bus when in fact they do not. The reason is that set_msi_sid_cb()
> assumes that pdev is fixed, while actually pci_for_each_dma_alias() can
> call fn() when pdev is set to a subordinate device.
> 
> As a result, running an VM on ESX with VT-d emulation enabled can
> results in the log warning such as:
> 
>   DMAR: [INTR-REMAP] Request device [00:11.0] fault index 3b [fault reason 38] Blocked an interrupt request due to source-id verification failure
> 
> This seems to cause additional ata errors such as:
>   ata3.00: qc timeout (cmd 0xa1)
>   ata3.00: failed to IDENTIFY (I/O error, err_mask=0x4)
> 
> These timeouts also cause boot to be much longer and other errors.
> 
> Fix it by checking comparing the alias with the previous one instead.
> 
> Fixes: 3f0c625c6ae71 ("iommu/vt-d: Allow interrupts from the entire bus for aliased devices")
> Cc: stable@vger.kernel.org
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Nadav Amit <namit@vmware.com>

This looks good to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks!

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
