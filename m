Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FFD7636
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 14:14:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A486E28;
	Tue, 15 Oct 2019 12:14:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A5809E18
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:14:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F01945D3
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:14:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 445092D9; Tue, 15 Oct 2019 14:14:26 +0200 (CEST)
Date: Tue, 15 Oct 2019 14:14:24 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Subject: Re: iommu: amd: Fix incorrect PASID decoding from event log
Message-ID: <20191015121424.GM14518@8bytes.org>
References: <1571083556-105953-1-git-send-email-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571083556-105953-1-git-send-email-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Oct 14, 2019 at 08:06:05PM +0000, Suthikulpanit, Suravee wrote:
> IOMMU Event Log encodes 20-bit PASID for events:
>     ILLEGAL_DEV_TABLE_ENTRY
>     IO_PAGE_FAULT
>     PAGE_TAB_HARDWARE_ERROR
>     INVALID_DEVICE_REQUEST
> as:
>     PASID[15:0]  = bit 47:32
>     PASID[19:16] = bit 19:16
> 
> Note that INVALID_PPR_REQUEST event has different encoding
> from the rest of the events as the following:
>     PASID[15:0]  = bit 31:16
>     PASID[19:16] = bit 45:42
> 
> So, fixes the decoding logic.
> 
> Fixes: d64c0486ed50 ("iommu/amd: Update the PASID information printed to the system log")
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Gary R Hook <gary.hook@amd.com>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd_iommu.c       | 5 +++--
>  drivers/iommu/amd_iommu_types.h | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied for v5.4, thanks Suravee.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
