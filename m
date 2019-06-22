Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FC4F817
	for <lists.iommu@lfdr.de>; Sat, 22 Jun 2019 21:47:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0CCCD1863;
	Sat, 22 Jun 2019 19:47:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 985FB185C
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 19:47:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 45F9B224
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 19:47:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id CF92E447; Sat, 22 Jun 2019 21:47:17 +0200 (CEST)
Date: Sat, 22 Jun 2019 21:47:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] Revert "iommu/vt-d: Fix lock inversion between
	iommu->lock and device_domain_lock"
Message-ID: <20190622194716.GA30910@8bytes.org>
References: <20190621023205.12936-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621023205.12936-1-peterx@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, dave.jiang@intel.com,
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

On Fri, Jun 21, 2019 at 10:32:05AM +0800, Peter Xu wrote:
> This reverts commit 7560cc3ca7d9d11555f80c830544e463fcdb28b8.

Applied and on its way upstream, thanks.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
