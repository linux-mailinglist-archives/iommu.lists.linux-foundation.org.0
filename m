Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E027FF81
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 14:53:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C613885B58;
	Thu,  1 Oct 2020 12:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKNhAHnizq+2; Thu,  1 Oct 2020 12:53:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42DA0856CB;
	Thu,  1 Oct 2020 12:53:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A03EC0051;
	Thu,  1 Oct 2020 12:53:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14FAFC0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3CE0280DA2
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bay-HLNxmVg for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 12:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B20D0861EE
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:53:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C52CA26F; Thu,  1 Oct 2020 14:53:23 +0200 (CEST)
Date: Thu, 1 Oct 2020 14:53:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v12 0/6] IOMMU user API enhancement
Message-ID: <20201001125322.GD30426@8bytes.org>
References: <1601051567-54787-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200928114053.79170d23@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928114053.79170d23@jacob-builder>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Jacob Pan <jacob.pan.linux@gmail.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Alex Williamson <alex.williamson@redhat.com>, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Yi Sun <yi.y.sun@intel.com>
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

Hi Jacob,

On Mon, Sep 28, 2020 at 11:40:53AM -0700, Jacob Pan wrote:
> Just wondering if you will be able to take this for v5.10? There hasn't
> been any material changes since we last discussed in LPC. We have VFIO and
> other vSVA patches depending on it.

Queued for v5.10 now, thanks.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
