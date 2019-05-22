Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B626427174
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 23:14:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7B10ACD;
	Wed, 22 May 2019 21:14:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F2709F0
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 21:14:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3ED21875
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 21:14:53 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
	[73.223.200.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 93FCB2173E;
	Wed, 22 May 2019 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558559692;
	bh=YqxAZ35p2dCb4ol3pLFSqCJ1k7KxyeByBxDmBp5VkbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Biw2BRIldASqZ6cE7U4pIVIimXdJqOYDrDywf8hjysNKnDbHBBRDCxBLaYFdxaREa
	wBSWEY84IXYCS7lrImeeL7RnVcgPlquYbwbyzAGRrQU4RFM1HrzAqumYf9fCOUmrXb
	HSPkkDTQc8Qx4QtRRP7kzgPAuGr1wtp6yzxFBj3w=
Date: Wed, 22 May 2019 14:14:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [RESEND PATCH] iommu/intel: fix variable 'iommu' set but not used
Message-Id: <20190522141452.9105fbd041ed24eedde950b9@linux-foundation.org>
In-Reply-To: <1558557386-17160-1-git-send-email-cai@lca.pw>
References: <1558557386-17160-1-git-send-email-cai@lca.pw>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
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

On Wed, 22 May 2019 16:36:26 -0400 Qian Cai <cai@lca.pw> wrote:

> The commit cf04eee8bf0e ("iommu/vt-d: Include ACPI devices in iommu=pt")
> added for_each_active_iommu() in iommu_prepare_static_identity_mapping()
> but never used the each element, i.e, "drhd->iommu".
> 
> drivers/iommu/intel-iommu.c: In function
> 'iommu_prepare_static_identity_mapping':
> drivers/iommu/intel-iommu.c:3037:22: warning: variable 'iommu' set but
> not used [-Wunused-but-set-variable]
>   struct intel_iommu *iommu;
> 
> Fixed the warning by passing "drhd->iommu" directly to
> for_each_active_iommu() which all subsequent self-assignments should be
> ignored by a compiler anyway.
> 

Yes, assigning drhd->iommu to itself seems a bit nasty.  Maybe this is
a case for __mabe_unused (with a comment explaining why), if that fixes
the warning.  Dunno.

btw, for_each_active_dev_scope() and for_each_dev_scope() should be
dragged out and shot.  Or at least, should have those single-char
identifiers changed into something meaningful so poor sods like me have
a hope of understanding the code :(

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
