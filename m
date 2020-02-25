Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A216EAC3
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 17:03:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F80D863D9;
	Tue, 25 Feb 2020 16:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pl3PKErXMrns; Tue, 25 Feb 2020 16:02:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7A85863AE;
	Tue, 25 Feb 2020 16:02:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5895C0177;
	Tue, 25 Feb 2020 16:02:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B14F8C0177
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 16:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9D0E786819
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 16:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1cY+xAsR4cl for <iommu@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 16:02:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9B238680D
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 16:02:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 08:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="438109107"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
 by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2020 08:02:50 -0800
Subject: Re: [PATCH] MAINTAINERS: add maintainers for uacce
To: Zhangfei Gao <zhangfei.gao@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 jonathan.cameron@huawei.com, grant.likely@arm.com,
 jean-philippe <jean-philippe@linaro.org>, Jerome Glisse
 <jglisse@redhat.com>, ilias.apalodimas@linaro.org, francois.ozog@linaro.org,
 kenneth-lee-2012@foxmail.com, Wangzhou <wangzhou1@hisilicon.com>,
 "haojian . zhuang" <haojian.zhuang@linaro.org>, guodong.xu@linaro.org
References: <1582611475-32691-1-git-send-email-zhangfei.gao@linaro.org>
From: Dave Jiang <dave.jiang@intel.com>
Message-ID: <b424d911-7293-0048-3270-0f7c1502c928@intel.com>
Date: Tue, 25 Feb 2020 09:02:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1582611475-32691-1-git-send-email-zhangfei.gao@linaro.org>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 2/24/20 11:17 PM, Zhangfei Gao wrote:
> Add Zhangfei Gao and Zhou Wang as maintainers for uacce
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38fe2f3..22e647f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17039,6 +17039,16 @@ W:	http://linuxtv.org
>   S:	Maintained
>   F:	drivers/media/pci/tw686x/
>   
> +UACCE ACCELERATOR FRAMEWORK
> +M:	Zhangfei Gao <zhangfei.gao@linaro.org>
> +M:	Zhou Wang <wangzhou1@hisilicon.com>
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-uacce
> +F:	Documentation/misc-devices/uacce.rst
> +F:	drivers/misc/uacce/
> +F:	include/linux/uacce.h
> +F:	include/uapi/misc/uacce/

Mailing list for patch submission?
+L: linux-accelerators@lists.ozlabs.org ?

> +
>   UBI FILE SYSTEM (UBIFS)
>   M:	Richard Weinberger <richard@nod.at>
>   L:	linux-mtd@lists.infradead.org
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
