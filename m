Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C586E991C
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 10:24:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ECC09EFE;
	Wed, 30 Oct 2019 09:24:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52EEBEEB
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 09:24:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DC5498A
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 09:24:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 0617E34A; Wed, 30 Oct 2019 10:24:36 +0100 (CET)
Date: Wed, 30 Oct 2019 10:24:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] iommu/amd: Apply the same IVRS IOAPIC workaround to Acer
	Aspire A315-41
Message-ID: <20191030092433.GA5968@8bytes.org>
References: <20191021151721.12393-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021151721.12393-1-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
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

On Mon, Oct 21, 2019 at 05:17:21PM +0200, Takashi Iwai wrote:
> Acer Aspire A315-41 requires the very same workaround as the existing
> quirk for Dell Latitude 5495.  Add the new entry for that.
> 
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1137799
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/iommu/amd_iommu_quirks.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied for v5.4, thanks Takashi.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
