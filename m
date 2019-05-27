Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FD2B1A2
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 11:56:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D49A5170D;
	Mon, 27 May 2019 09:55:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 527061707
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 09:55:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D8F41A9
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 09:55:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 311DE272; Mon, 27 May 2019 11:55:38 +0200 (CEST)
Date: Mon, 27 May 2019 11:55:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: Fix bind svm with multiple devices
Message-ID: <20190527095536.GA8420@8bytes.org>
References: <1557343366-18686-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557343366-18686-1-git-send-email-jacob.jun.pan@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, Raj Ashok <ashok.raj@intel.com>
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

On Wed, May 08, 2019 at 12:22:46PM -0700, Jacob Pan wrote:
> If multiple devices try to bind to the same mm/PASID, we need to
> set up first level PASID entries for all the devices. The current
> code does not consider this case which results in failed DMA for
> devices after the first bind.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Reported-by: Mike Campin <mike.campin@intel.com>
> ---
>  drivers/iommu/intel-svm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied for v5.3, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
