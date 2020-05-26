Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A30081D0BB1
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 11:15:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 569E984917;
	Wed, 13 May 2020 09:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTYRIhGlUTS1; Wed, 13 May 2020 09:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D3709848FA;
	Wed, 13 May 2020 09:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7308C016F;
	Wed, 13 May 2020 09:15:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C192C016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B86B88699
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zZRsgPXDkQO for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 09:15:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2A67388687
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:15:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A4EB8379; Wed, 13 May 2020 11:15:38 +0200 (CEST)
Date: Wed, 13 May 2020 11:15:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Raul E Rangel <rrangel@chromium.org>
Subject: Re: [PATCH v2] iommu/amd: Fix get_acpihid_device_id()
Message-ID: <20200513091537.GJ9820@8bytes.org>
References: <20200511103229.v2.1.I6f1b6f973ee6c8af1348611370c73a0ec0ea53f1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511103229.v2.1.I6f1b6f973ee6c8af1348611370c73a0ec0ea53f1@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dianders@chromium.org,
 evgreen@chromium.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Kurtz <djkurtz@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, May 11, 2020 at 10:33:36AM -0600, Raul E Rangel wrote:
> acpi_dev_hid_uid_match() expects a null pointer for UID if it doesn't
> exist. The acpihid_map_entry contains a char buffer for holding the
> UID. If no UID was provided in the IVRS table, this buffer will be
> zeroed. If we pass in a null string, acpi_dev_hid_uid_match() will
> return false because it will try and match an empty string to the ACPI
> UID of the device.
> 
> Fixes: ae5e6c6439c3 ("iommu/amd: Switch to use acpi_dev_hid_uid_match()")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> 
> Changes in v2:
> - Added Suggested by
> - Fixed commit description
> - Decided to keep `p->uid[0]` instead of `*p->uid` since the data member is an array instead of a pointer.
> - Used clang-format
> 
>  drivers/iommu/amd_iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied for v5.7, thanks Raul.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
