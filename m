Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B6A4FA3
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 09:20:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C40A89EE;
	Mon,  2 Sep 2019 07:20:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82F18504
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 07:20:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E69DF5D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 07:20:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id DCCE4AF39;
	Mon,  2 Sep 2019 07:20:15 +0000 (UTC)
Subject: Re: [PATCH] swiotlb-zen: Convert to use macro
To: Souptick Joarder <jrdr.linux@gmail.com>, sstabellini@kernel.org,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <1567366136-874-1-git-send-email-jrdr.linux@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b0c46bfb-9903-a3da-be30-e5b3fbabc9bf@suse.com>
Date: Mon, 2 Sep 2019 09:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567366136-874-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 01.09.19 21:28, Souptick Joarder wrote:
> Rather than using static int max_dma_bits, this
> can be coverted to use as macro.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

s/zen/xen/ in the patch title, other than that:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
