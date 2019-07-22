Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F270233
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 16:22:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A173AB8F;
	Mon, 22 Jul 2019 14:22:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 37CB0A7A
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:22:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C75AE775
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:22:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8CE321F2; Mon, 22 Jul 2019 16:22:40 +0200 (CEST)
Date: Mon, 22 Jul 2019 16:22:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 7/7] iommu/vt-d: Consolidate domain_init() to avoid
	duplication
Message-ID: <20190722142238.GA12009@8bytes.org>
References: <20190612002851.17103-1-baolu.lu@linux.intel.com>
	<20190612002851.17103-8-baolu.lu@linux.intel.com>
	<20190718171615.2ed56280@x1.home>
	<f56599a6-77ac-e1ef-4843-51167b1284b3@linux.intel.com>
	<20190719091952.58255c47@x1.home>
	<13294960-c040-c501-c279-aa61d780d25e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13294960-c040-c501-c279-aa61d780d25e@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	Alex Williamson <alex.williamson@redhat.com>,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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

On Sat, Jul 20, 2019 at 09:15:58AM +0800, Lu Baolu wrote:
> Okay. I agree wit you. Let's revert this commit first.

Reverted the patch and queued it to my iommu/fixes branch.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
