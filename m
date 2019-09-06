Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFFAB41C
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 10:37:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 113771E93;
	Fri,  6 Sep 2019 08:37:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62A941557
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 08:37:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C642A756
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 08:37:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0DC41AB87;
	Fri,  6 Sep 2019 08:37:17 +0000 (UTC)
Date: Fri, 6 Sep 2019 10:37:15 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH] amd/iommu: flush old domains in kdump kernel
Message-ID: <20190906083715.GD5457@suse.de>
References: <9d271f88-949a-7356-c516-be95b1566c94@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d271f88-949a-7356-c516-be95b1566c94@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Sep 05, 2019 at 12:09:48PM -0500, Stuart Hayes wrote:
> When devices are attached to the amd_iommu in a kdump kernel, the old device
> table entries (DTEs), which were copied from the crashed kernel, will be
> overwritten with a new domain number.  When the new DTE is written, the IOMMU
> is told to flush the DTE from its internal cache--but it is not told to flush
> the translation cache entries for the old domain number.
> 
> Without this patch, AMD systems using the tg3 network driver fail when kdump
> tries to save the vmcore to a network system, showing network timeouts and
> (sometimes) IOMMU errors in the kernel log.
> 
> This patch will flush IOMMU translation cache entries for the old domain when
> a DTE gets overwritten with a new domain number.

Hmm, this seems to point to an interesting implementation detail of the
AMD IOMMUs. In theory, when the DTE is flushed, there shouldn't be any
device transactions looked up with the old domain id anymore, and thus
no faults should happen.

Anyway, applied the patch, thanks.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
