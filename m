Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 911865FAF3
	for <lists.iommu@lfdr.de>; Thu,  4 Jul 2019 17:36:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3C19315EA;
	Thu,  4 Jul 2019 15:36:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B81315EA
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 15:35:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0801187B
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 15:35:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 460884F1; Thu,  4 Jul 2019 17:35:52 +0200 (CEST)
Date: Thu, 4 Jul 2019 17:35:52 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] omap-iommu: no need to check return value of
	debugfs_create functions
Message-ID: <20190704153551.GG3310@8bytes.org>
References: <20190704143649.GA11697@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704143649.GA11697@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 04, 2019 at 04:36:49PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Warning, not even test-built, but "should" work :)

It almost did :)

> +	debugfs_create_file("regs", 0400, d, obj, &attrregs_fops);
> +	debugfs_create_file("tlb", 0400, d, obj, &attrtlb_fops);
> +	debugfs_create_file("pagetable", 0400, d, obj, &attrpagetable_fops);

The _fops were named without the 'attr' prefix, changed that and it
compiled. Patch is now applied.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
